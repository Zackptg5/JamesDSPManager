(
[ -d $NVBASE/aml/$MODID ] && DIR=$NVBASE/aml/$MODID || DIR=$MODDIR # AML Workaround

for i in $(find $DIR/system/odm -type f -name "*audio_effects*.conf" -o -name "*audio_effects*.xml"); do 
  j="$(echo $i | sed "s|$DIR/system||")"
  mount -o bind $i $j
done
killall -q audioserver
)&
