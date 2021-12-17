#!/bin/bash
PGPASSWORD='password'
$HOST=""
PGPASSWORD=$PGPASSWORD psql -U postgres -h $HOST -p 5432 -d rates -f ../db/rates.sql
