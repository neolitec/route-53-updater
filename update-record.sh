#!/bin/bash

update () {
    ZONE_ID=$(echo "$*" | cut -d: -f1)
    RECORD_NAME=$(echo "$*" | cut -d: -f2)

    mkdir -p /root/data/"${RECORD_NAME/\*/x}"
    route53-updater -z "$ZONE_ID" -r "$RECORD_NAME" -p /root/data/"${RECORD_NAME/\*/x}"
}

mkdir -p /root/data

while IFS= read -r line
do
    update "$line"
done < /root/config/records.txt
