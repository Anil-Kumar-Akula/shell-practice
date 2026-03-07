#!/bin/bash
# SEASON=rain

# if [ "$SEASON" = "rain" ]; then
#     echo "using the umbrella because of rain"

# else 
#   echo "using the sun glasses dues to high temperature"
# fi

NUMBER=$1

if [  $NUMBER -gt 10 ]; then
 echo "$NUMBER is not greater than 10"
elif [ $NUMBER -eq 10 ]; then
 echo "$NUMBER is equal to 10"
else
 echo "$NUMBER is greater than 10"
fi