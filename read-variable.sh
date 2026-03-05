#!/bin/bash

# echo "Please enter your name"
# read name

# echo "Please enter your pin"
# read -s pin

# echo "name entered as :: $name"
# echo "pin entered as :: $pin"

DATE=$(date)


Start_time=$(date)
echo "Start time ::$Start_time"
sleep 15
End_time=$(date)
echo "End time :: $End_time"

Total_time="$($End_time-$Start_time)"

echo "Total time :: $Total_time"