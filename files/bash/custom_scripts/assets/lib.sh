#!/bin/bash

source "$HOME/custom_scripts/assets/colors"

LOG_LEVEL="${LOG_LEVEL:-INFO}"

# Log levels
# shellcheck disable=SC2034
DEBUG="0"
# shellcheck disable=SC2034
INFO="1"
# shellcheck disable=SC2034
WARNING="2"
# shellcheck disable=SC2034
ERROR="3"

# Usage:
# logger <log-level> <color> <text-to-log>
# Example:
# logger "DEBUG" "YELLOW" "Something to log"
function logger {
	local level="$1"
	local color="${!2}"
	local prefix="[${level}]"
	local log_level_number="${!level}"
	shift
	shift

	if [[ "$log_level_number" -ge "${!LOG_LEVEL}" ]]; then
		echo -e "${color}${prefix} $(date --iso-8601=seconds): " "$@" "${NO_COLOR}"
	fi
}

# Usage:
# parseArgs <arguments-to-look-for> <required-arguments> <arguments-to-parse>
# Example:
# parseArgs "--option1,--option2" "--option2" "$@"
function parseArgs {
	readarray -td, opts < <(printf "%s" "$1,")
	shift
	readarray -td, required_opts < <(printf "%s" "$1,")
	shift

	logger "DEBUG" "YELLOW" "Parsing arguments: " "${opts[@]}"
	logger "DEBUG" "YELLOW" "Required arguments: " "${required_opts[@]}"

	while [[ "$#" -gt 0 ]]; do
		for opt in "${opts[@]}"; do
			if [[ "$1" == "$opt" ]]; then
				logger "DEBUG" "YELLOW" "Found $opt, value $2"
				local variable_name="${opt#--}"
				variable_name="${variable_name//-/_}"
				variable_name="${variable_name^^}"

				eval "$variable_name=\"$2\""
				shift
			fi
		done
		shift
	done
}

function confirm {
	echo -e "$1"
	read -r -p "Are you sure? [y/N] " response
	case "$response" in
	[yY][eE][sS] | [yY])
		true
		;;
	*)
		false
		;;
	esac
}
