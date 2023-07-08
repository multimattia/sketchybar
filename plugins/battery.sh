#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
  8[0-9]|100)
      ICON="􀛨"
      ICON_COLOR=0xff39515e
  ;;
  [6-7][0-9])
      ICON="􀺸"
      ICON_COLOR=0xff39515e
  ;;
  [4-5][0-9])
      ICON="􀺶"
      ICON_COLOR=0xffc2c4f2
  ;;
  [1-2][0-9])
      ICON="􀛩"
      ICON_COLOR=0xffc7d1f3
  ;;
  *)
     ICON="􀛪"
      ICON_COLOR=0xfff5a97f
esac

if [[ $CHARGING != "" ]]; then
  ICON="􀡸"
  ICON_COLOR=0xffaaf5aa
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set $NAME \
icon="$ICON" \
label="${PERCENTAGE}%" \
icon.color=${ICON_COLOR}
