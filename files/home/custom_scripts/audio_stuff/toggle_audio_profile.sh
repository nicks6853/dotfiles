#!/bin/bash

set -e

card_name="bluez_card.50_C2_75_64_E7_67"
current_profile="$(pactl list cards | awk -v RS='' '/bluez/' | awk -F': ' '/Active Profile/ { print $2 }')"

echo "Current profile: $current_profile"

if [[ "$current_profile" == "a2dp_sink" ]]; then
    echo "Switched to hands free"
    pactl set-card-profile "$card_name" handsfree_head_unit
else
    echo "Switched to high fidelity"
    pactl set-card-profile "$card_name" a2dp_sink
fi
