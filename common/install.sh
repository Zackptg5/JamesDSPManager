osp_detect() {
  case $1 in
    *.conf) SPACES=$(sed -n "/^output_session_processing {/,/^}/ {/^ *music {/p}" $1 | sed -r "s/( *).*/\1/")
            EFFECTS=$(sed -n "/^output_session_processing {/,/^}/ {/^$SPACES\music {/,/^$SPACES}/p}" $1 | grep -E "^$SPACES +[A-Za-z]+" | sed -r "s/( *.*) .*/\1/g")
            for EFFECT in ${EFFECTS}; do
              SPACES=$(sed -n "/^effects {/,/^}/ {/^ *$EFFECT {/p}" $1 | sed -r "s/( *).*/\1/")
              [ "$EFFECT" != "atmos" ] && sed -i "/^effects {/,/^}/ {/^$SPACES$EFFECT {/,/^$SPACES}/ s/^/#/g}" $1
            done;;
     *.xml) EFFECTS=$(sed -n "/^ *<postprocess>$/,/^ *<\/postprocess>$/ {/^ *<stream type=\"music\">$/,/^ *<\/stream>$/ {/<stream type=\"music\">/d; /<\/stream>/d; s/<apply effect=\"//g; s/\"\/>//g; p}}" $1)
            for EFFECT in ${EFFECTS}; do
              [ "$EFFECT" != "atmos" ] && sed -ri "s/^( *)<apply effect=\"$EFFECT\"\/>/\1<\!--<apply effect=\"$EFFECT\"\/>-->/" $1
            done;;
  esac
}

# Tell user aml is needed if applicable
FILES=$(find $NVBASE/modules/*/system $MODULEROOT/*/system -type f -name "*audio_effects*.conf" -o -name "*audio_effects*.xml" 2>/dev/null | sed "/$MODID/d")
if [ ! -z "$FILES" ] && [ ! "$(echo $FILES | grep '/aml/')" ]; then
  ui_print " "
  ui_print "   ! Conflicting audio mod found!"
  ui_print "   ! You will need to install !"
  ui_print "   ! Audio Modification Library !"
  sleep 3
fi

ui_print " "
ui_print "- Select Huawei -"
ui_print "   Is this a device with 64bit audio libs (like huawei)?"
ui_print "   If unsure, select 'No'"
ui_print "   Vol Up = Yes, Vol Down = No"
if chooseport; then
  QARCH="huawei"
  cp_ch $MODPATH/common/files/$QARCH/libjamesdsp.so $MODPATH/system/lib64/soundfx/libjamesdsp.so
else
  QARCH=$ARCH32
fi
cp_ch $MODPATH/common/files/$QARCH/libjamesdsp.so $MODPATH/system/lib/soundfx/libjamesdsp.so

# App only works when installed normally to data in oreo+
install_script -l $MODPATH/common/files/jdsp.sh
sed -i "/jdsp.sh/d" $INFO
INSVER=$(pm list packages -3 --show-versioncode | grep james.dsp | sed 's/.*versionCode://')
[ "$INSVER" ] && { [ $INSVER -lt $APPVER ] && pm uninstall james.dsp >/dev/null; }

ui_print " "
ui_print "   Patching existing audio_effects files..."
PARTITIONS="/system /vendor $PARTITIONS"
CFGS="$(find $PARTITIONS -type f -name "*audio_effects*.conf" -o -name "*audio_effects*.xml")"
for OFILE in ${CFGS}; do
  FILE="$MODPATH$(echo $OFILE | sed "s|^/vendor|/system/vendor|g")"
  $KSU && FILE="$(echo $FILE | sed "s|^/odm|/system/odm|g")"
  cp_ch -n $ORIGDIR$OFILE $FILE
  osp_detect $FILE
  case $FILE in
    *.conf) sed -i "/jamesdsp {/,/}/d" $FILE
            sed -i "/jdsp {/,/}/d" $FILE
            sed -i "s/^effects {/effects {\n  jamesdsp {\n    library jdsp\n    uuid f27317f4-c984-4de6-9a90-545759495bf2\n  }/g" $FILE
            sed -i "s/^libraries {/libraries {\n  jdsp {\n    path $LIBPATCH\/lib\/soundfx\/libjamesdsp.so\n  }/g" $FILE;;
    *.xml) sed -i "/jamesdsp/d" $FILE
           sed -i "/jdsp/d" $FILE
           sed -i "/<libraries>/ a\        <library name=\"jdsp\" path=\"libjamesdsp.so\"\/>" $FILE
           sed -i "/<effects>/ a\        <effect name=\"jamesdsp\" library=\"jdsp\" uuid=\"f27317f4-c984-4de6-9a90-545759495bf2\"\/>" $FILE;;
  esac
done

ui_print "   Copying apk to /sdcard. Install manually if not present on reboot"
cp -rf $MODPATH/common/files/JamesDSP /storage/emulated/0/JamesDSP
cp -f $MODPATH/JamesDSPManager.apk /storage/emulated/0/JamesDSPManager.apk
[ $API -gt 29 ] && { ui_print "   Enabling hidden api policy"; settings put global hidden_api_policy 1 2>/dev/null; }
