#!/bin/bash

echo "Initializing MySQL database..."
mysql -h 10.155.16.5 -u master -pqwe123!@# <<EOF
CREATE DATABASE IF NOT EXISTS petclinic;
EOF

echo "Adding sample data to the database..."
mysql -h 10.155.16.5 -u master -pqwe123!@# petclinic < /docker-entrypoint-initdb.d/data.sql

echo "Database initialization and data insertion complete."