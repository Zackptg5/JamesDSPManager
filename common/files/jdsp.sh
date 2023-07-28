(
while [ "$(getprop sys.boot_completed)" != "1" ]; do
  sleep 1
done
sleep 3

APP=$(pm list packages -3 | grep james.dsp)

if [ ! -d "$MODPATH" ]; then
  [ "$APP" ] && pm uninstall james.dsp
  rm $0
  exit 0
elif [ "$APP" ]; then
  STATUS="$(pm list packages -d | grep 'james.dsp')"
  if [ -f "$MODPATH/disable" ] && [ ! "$STATUS" ]; then
    pm disable james.dsp
  elif [ ! -f "$MODPATH/disable" ] && [ "$STATUS" ]; then
    pm enable james.dsp
  fi
elif [ ! -f "$MODPATH/disable" ] && [ ! "$APP" ]; then
  pm install $MODPATH/JamesDSPManager.apk
  pm disable james.dsp
  pm enable james.dsp
fi
)&
