#!/bin/bash
set -e

#psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -c "CREATE DATABASE epcis_ac"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" epcis_ac <<-EOSQL
	CREATE TABLE oauth_access_tokens(access_token text,client_id text,expires timestamp,user_id text);
	CREATE TABLE oauth_clients(client_id text,client_secret text,redirect_uri text);
	CREATE TABLE oauth_refresh_tokens(refresh_token text,client_id text,expires timestamp,user_id text);
	CREATE TABLE users(id uuid,username text,groupname text,password text);
	CREATE EXTENSION IF NOT EXISTS "pgcrypto";
	CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
EOSQL