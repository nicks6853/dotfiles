#!/bin/bash

CARD_NAME="$1"
CARD_PROFILE="$2"
card=$(pactl list cards | awk -v RS="" -F'\n' -v pattern="Name: $CARD_NAME" '$0 ~ pattern {print $1}' | awk '{print $2}' | tr -d '#')

pactl set-card-profile "$card" "$CARD_PROFILE"
