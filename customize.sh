# This is customize the module installation process if you need

my_grep_prop() {
  local REGEX="s/$1=//p"
  shift
  local FILES=$@
  [ -z "$FILES" ] && FILES='/system/build.prop /vendor/build.prop /product/build.prop'
  sed -n "$REGEX" $FILES 2>/dev/null | head -n 1
}

# save device infos
MANUFACTURER="$(my_grep_prop 'ro\.product\.manufacturer')"
MODEL="$(my_grep_prop 'ro\.product\.model')"
DEVICE="$(my_grep_prop 'ro\.product\.device')"
[ -z "$MANUFACTURER" ] && MANUFACTURER="$(my_grep_prop 'ro\.product\.vendor\.manufacturer')"
[ -z "$MODEL" ] && MODEL="$(my_grep_prop 'ro\.product\.vendor\.model')"
[ -z "$DEVICE" ] && DEVICE="$(my_grep_prop 'ro\.product\.vendor\.device')"
printf "%s\n%s\n%s\n%s\n%s\n" "MANUFACTURER=$MANUFACTURER" "MODEL=$MODEL" "DEVICE=$DEVICE" > "$MODPATH/.env"

# print device infos
ui_print "	                	     "

ui_print "***************************"
ui_print "	 Snapchat Pixel Mod 	 "
ui_print "	     by MLGDash 	     "
ui_print "***************************"

ui_print "	                	     "
ui_print "-- Device info --"
ui_print "$(cat $MODPATH/.env)"