#!/bin/bash

echo "Initializing MySQL database..."
mysql -h <MYSQL IP 기입> -u root -p<PW 기입> <<EOF
CREATE DATABASE IF NOT EXISTS petclinic;
EOF

echo "Adding sample data to the database..."
mysql -h <MYSQL IP 기입> -u root -p<PW 기입> petclinic < /docker-entrypoint-initdb.d/data.sql

echo "Database initialization and data insertion complete."