#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE DATABASE demo_ds_0;
  CREATE DATABASE demo_ds_1;
  CREATE DATABASE demo_ds_2;
EOSQL
