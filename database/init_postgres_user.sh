#!/bin/bash

# Add this file to /docker-entrypoint-initdb.d/init_postgres_user.sh:

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER plantgrower WITH PASSWORD $PLANTGROWER_USER_PASSWORD;
    GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO plantgrower;
EOSQL