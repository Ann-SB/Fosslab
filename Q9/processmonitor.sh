#!/bin/bash

# process monitor
echo "Welcome to process monitor"

while true;
do
echo
string=$(top -b -o +%MEM | head -n 8 | tail -n 1 | cut -d ' ' -f2,17,18-19)
string=$(top -b -o +%MEM | head -n 8 |tail -n 1 | awk '{print $1 "  " $9 "  " $10}')
process_id=$(echo $string | cut -d ' ' -f1)
cpu_use=$(echo $string | cut -d ' ' -f2)
mem_use=$(echo $string | cut -d ' ' -f3)

echo "PID : $process_id  CPU : $cpu_use  MEM : $mem_use"
if [ $(($(echo $mem_use | cut -d '.' -f1))) -gt 15 ]
then
	echo "Killing $process_id"
	echo $(kill $process_id)
elif [ $(($(echo $cpu_use | cut -d '.' -f1))) -gt 120 ]
then
	echo "Killing $process_id"
	echo $(kill $process_id)
fi
sleep 5;
done
