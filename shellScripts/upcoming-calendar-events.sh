#!/bin/bash

############################################################
#                                                          #
#                   FORMATTING VARIABLES                   #
#                                                          #
############################################################

FG_DEFAULT="\e[39m"
FG_BLACK="\e[30m"
FG_RED="\e[31m"
FG_GREEN="\e[32m"
FG_YELLOW="\e[33m"
FG_BLUE="\e[34m"
FG_MAGENTA="\e[35m"
FG_CYAN="\e[36m"
FG_L_GRAY="\e[37m"
FG_D_GRAY="\e[90m"
FG_L_RED="\e[91m"
FG_L_GREEN="\e[92m"
FG_L_YELLOW="\e[93m"
FG_L_BLUE="\e[94m"
FG_L_MAGENTA="\e[95m"
FG_L_CYAN="\e[96m"
FG_WHITE="\e[97m"

BG_DEFAULT="\e[49m"
BG_BLACK="\e[40m"
BG_RED="\e[41m"
BG_GREEN="\e[42m"
BG_YELLOW="\e[43m"
BG_BLUE="\e[44m"
BG_MAGENTA="\e[45m"
BG_CYAN="\e[46m"
BG_L_GRAY="\e[47m"
BG_D_GRAY="\e[100m"
BG_L_RED="\e[101m"
BG_L_GREEN="\e[102m"
BG_L_YELLOW="\e[103m"
BG_L_BLUE="\e[104m"
BG_L_MAGENTA="\e[105m"
BG_L_CYAN="\e[106m"
BG_WHITE="\e[107m"

reset="\e[0m"
bold="\e[1m"

show_upcoming=2

next_events=`/opt/homebrew/bin/gcalcli --calendar "lucas@amalgama.co" agenda \`date '+%Y/%m/%d'\` \`date -v +1d '+%Y/%m/%d'\` --tsv --nostarted | grep -m${show_upcoming} ""`
first_line_output=""
second_line_output=""

current_time_timestamp=`date -u -j -f "%b %d %Y %H:%M:%S" "Jan 01 1970 \`date '+%H:%M'\`:00" +%s`

NO_EVENTS_PLACEHOLDER="${FG_D_GRAY}No upcoming events${reset}"

if [ -z "$next_events" ]
then
	printf "${NO_EVENTS_PLACEHOLDER}"
else
	while IFS= read -r line; do
		event_name=`echo "${line}" | /usr/bin/cut -f5 | grep -m1 ""`
		event_time=`echo "${line}" | /usr/bin/cut -f2 | grep -m1 ""`

		event_time_timestamp=`date -u -j -f "%b %d %Y %H:%M:%S" "Jan 01 1970 ${event_time}:00" +%s`
		difference_time_timestamp="$(($event_time_timestamp-$current_time_timestamp))"
		difference_time_hours=`date -u -r ${difference_time_timestamp} +%H | sed 's/^0*//'`
		difference_time_minutes=`date -u -r ${difference_time_timestamp} +%M | sed 's/^0*//'`

		first_line_output+=" | ${FG_YELLOW}${bold}${event_name}${reset}@${event_time}hs ${FG_D_GRAY}(-`if [ ! -z "$difference_time_hours" ]; then echo "${difference_time_hours}h"; fi` `if [ ! -z "$difference_time_minutes" ]; then echo "${difference_time_minutes}m"; fi`)${reset}"
		second_line_output+=" | 👉 ${FG_D_GRAY} `if [ ! -z "$difference_time_hours" ]; then echo "${difference_time_hours}h"; fi` `if [ ! -z "$difference_time_minutes" ]; then echo "${difference_time_minutes}m"; fi`${reset}"
	done <<< "$next_events"

	printf "${first_line_output:3}\n"
	# printf "${second_line_output:3}\n"
fi
