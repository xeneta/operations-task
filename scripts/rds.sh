#!/bin/bash
PGPASSWORD='password'
PGPASSWORD=$PGPASSWORD psql -U postgres -h app-database.cme2qbt5q5x2.eu-west-2.rds.amazonaws.com -p 5432 -d rates -f ../db/rates.sql
