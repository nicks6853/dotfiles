#!/bin/bash
set -x

current_profile="$(pactl list cards | awk -v RS='' '/bluez/' | awk -F': ' '/Active Profile/ { print $2 }')"
echo $current_profile

if ! [[ "$current_profile" == "handsfree_head_unit" ]]; then
    echo "shut off bluez"
    bash /home/nick/custom_scripts/set_card_profile.sh "bluez_card.50_C2_75_64_E7_67" "headset-head-unit"
fi

SINK_NAME="bluez_output.50_C2_75_64_E7_67.1"
sink=$(pactl list sinks | awk -v RS="" -F'\n' -v pattern="Name: $SINK_NAME" '$0 ~ pattern {print $1}' | awk '{print $2}' | tr -d '#')

SOURCE_NAME="bluez_input.50_C2_75_64_E7_67.0"
source=$(pactl list sources | awk -v RS="" -F'\n' -v pattern="Name: $SOURCE_NAME" '$0 ~ pattern {print $1}' | awk '{print $2}' | tr -d '#')

pactl set-default-sink "$sink"
pactl set-default-source "$source"
pactl set-source-volume "$source" 100%
