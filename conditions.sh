#!/bin/bash
# SEASON=rain

# if [ "$SEASON" = "rain" ]; then
#     echo "using the umbrella because of rain"

# else 
#   echo "using the sun glasses dues to high temperature"
# fi

# NUMBER=$1

# if [  $NUMBER -lt 10 ]; then
#  echo "$NUMBER is less than 10"
# elif [ $NUMBER -eq 10 ]; then
#  echo "$NUMBER is equal to 10"
# else
#  echo "$NUMBER is greater than 10"
# fi

EVEN=$1

if [ $EVEN * 2 -eq 0 ]; then
 echo "$EVEN is a even number"
else
 echo "$EVEN is a odd number"
fi