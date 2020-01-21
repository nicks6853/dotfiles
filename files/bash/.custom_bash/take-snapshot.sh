#!/bin/bash

set -e

printf "What is the db-instance-identifier? "
read db_instance_identifier
snapshot_identifier="$db_instance_identifier-$(uuidgen)"

echo "Creating snapshot $snapshot_identifier"

aws rds create-db-snapshot --db-instance-identifier "$db_instance_identifier" --db-snapshot-identifier "$snapshot_identifier" >> /dev/null 2>&1

status="$(aws rds describe-db-snapshots --db-snapshot-identifier "$snapshot_identifier" | jq -r ".DBSnapshots[0].Status")"
printf "Creating snaphost for $db_instance_identifier."
while [ "$status" == "creating" ]; do
	status="$(aws rds describe-db-snapshots --db-snapshot-identifier "$snapshot_identifier" | jq -r ".DBSnapshots[0].Status")"
	printf "."
	sleep 2
done
echo "Done!"
