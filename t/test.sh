#!/usr/bin/env bash
#===============================================================================
#
#          FILE: test.sh
#         USAGE: ./test.sh 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Cesar Bodden (), cesar@pissedoffadmins.com
#  ORGANIZATION: pissedoffadmins.com
#       CREATED: 06/25/2019 08:57:48 PM EDT
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

## this taken from : https://www.linuxjournal.com/article/9819

function rollDie()
{
    sides=${1:-6}
    dieroll=$(( ( $RANDOM % $sides ) + 1 ))
}

rollDie ; dice[1]=$dieroll
rollDie ; dice[2]=$dieroll
rollDie ; dice[3]=$dieroll
rollDie ; dice[4]=$dieroll
rollDie ; dice[5]=$dieroll

echo -n "You rolled [${dice[1]}], [${dice[2]}], [${dice[3]}], "
echo    "[${dice[4]}] and [${dice[5]}]"

echo -n "Reroll which dice? "

read answer
for reroll in $answer
do
    if [ $reroll -lt 1 -o $reroll -gt 5 ] ; then
        echo "Invalid entry: $reroll. Please enter 1-5"
    else
        rollDie
        dice[$reroll]=$dieroll
    fi
done

echo -n "Your new  roll: [${dice[1]}], [${dice[2]}], [${dice[3]}], "
echo    "[${dice[4]}] and [${dice[5]}]"

exit 0

