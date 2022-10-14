#!/bin/bash
echo -n  "Write numbers: "
read -a numbers
max_num=${numbers[0]}
size=${#numbers[@]}


for ((i = 0; i < size; i++)); do
        if [[ ${numbers[i]} -gt $max_num ]]; then
                max_num=${numbers[i]}
        fi
done
echo $max_num
