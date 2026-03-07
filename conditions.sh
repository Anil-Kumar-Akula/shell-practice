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

# NUMBER=$1

# if [ $((NUMBER % 2)) -eq 0 ]; then
#  echo "$NUMBER is a even  number"
# else
#  echo "$NUMBER is a odd number"
# fi

echo "enter the number to check the prime number"
read NUMBER
count=0

for  (( i=1; i<=NUMBER; i++))
do
    if [ $((NUMBER % i)) -eq 0 ]; then
        ((count++))
    fi
done
if [ $count -eq 2 ]; then
 echo "$NUMBER is a prime number"
else
 echo "$NUMBER is not a prime number"
fi