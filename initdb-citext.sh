#!/bin/sh

set -e

# Perform all actions as $POSTGRES_USER
export PGUSER="$POSTGRES_USER"

# Load citext into both template and $POSTGRES_DB
for DB in template1 "$POSTGRES_DB"; do
	echo "Loading citext extensions into $DB"
	"${psql[@]}" --dbname="$DB" <<-'EOSQL'
		CREATE EXTENSION IF NOT EXISTS citext;
EOSQL
done
