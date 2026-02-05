#!/bin/bash

set -x

current_profile="$(pactl list cards | awk -v RS='' '/bluez/' | awk -F': ' '/Active Profile/ { print $2 }')"

if ! [[ "$current_profile" == "off" ]]; then
    echo "shut off bluez"
    bash /home/nick/custom_scripts/set_card_profile.sh "bluez_card.50_C2_75_64_E7_67" "off"
fi

CARD_NAME="alsa_card.pci-0000_64_00.1.13"
card=$(pactl list cards | awk -v RS="" -F'\n' -v pattern="Name: $CARD_NAME" '$0 ~ pattern {print $1}' | awk '{print $2}' | tr -d '#')

SINK_ALSA_ID="HDMI / DisplayPort 1 Output"
sink=$(pactl list sinks | awk -v RS="" -F'\n' -v pattern="device.profile.description = \"$SINK_ALSA_ID\"" '$0 ~ pattern {print $1}' | awk '{print $2}' | tr -d '#')

SOURCE_NAME="alsa_input.pci-0000_64_00.6.13.HiFi__hw_acp63__source"
source=$(pactl list sources | awk -v RS="" -F'\n' -v pattern="Name: $SOURCE_NAME" '$0 ~ pattern {print $1}' | awk '{print $2}' | tr -d '#')

# pactl set-card-profile "$card"
pactl set-default-sink "$sink"
pactl set-default-source "$source"
