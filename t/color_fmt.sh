#!/usr/bin/env bash
LC_ALL=C
LANG=C
set -o pipefail
set -o errexit

##printf "1234567890123456789012345678901234567\n";

printf "%s" "How many players ? : "
read PLAYERS
_PLYR=$((${PLAYERS}+1))


_CNT=1
while [ ${_CNT} -lt ${_PLYR} ]
do
    printf "%-17s%-5s%-5s%-5s%-5s%-5s\n" \
        "$(tput setaf ${_CNT})player ${_CNT}:" \
        "[$((($RANDOM%6)+1))]" \
        "[$((($RANDOM%6)+1))]" \
        "[$((($RANDOM%6)+1))]" \
        "[$((($RANDOM%6)+1))]" \
        "[$((($RANDOM%6)+1))]$(tput sgr0)"

    let _CNT=${_CNT}+1
done
