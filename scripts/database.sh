#!/bin/bash

DB_DIR="./scripts/databases"

create_database() {
    read -p "Enter database name: " dbname
    if [[ -d "$DB_DIR/$dbname" ]]; then
        echo "Database already exists!"
    else
        mkdir -p "$DB_DIR/$dbname"
        echo "Database $dbname created."
    fi
}

list_databases() {
    echo "Available Databases:"
    ls "$DB_DIR"
}

connect_database() {
    read -p "Enter database name: " dbname
    if [[ -d "$DB_DIR/$dbname" ]]; then
        echo "Connected to $dbname"
        source "$(dirname "$0")/table.sh" "$DB_DIR/$dbname"
    else
        echo "Database does not exist!"
    fi
}

drop_database() {
    read -p "Enter database name to delete: " dbname
    if [[ -d "$DB_DIR/$dbname" ]]; then
        rm -rf "$DB_DIR/$dbname"
        echo "Database $dbname deleted."
    else
        echo "Database does not exist!"
    fi
}
