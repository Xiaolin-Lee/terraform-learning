#!/usr/bin/env bash
set -ue

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<EOSQL
  CREATE ROLE admin LOGIN ENCRYPTED PASSWORD '$POSTGRES_PASSWORD';
EOSQL
