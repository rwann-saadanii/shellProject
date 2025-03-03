#!/bin/bash

TABLE_DIR=$1

create_table() {
    read -p "Enter table name: " tablename
    if [[ -f "$TABLE_DIR/$tablename.data" ]]; then
        echo "Table already exists!"
    else
        touch "$TABLE_DIR/$tablename.data"
        touch "$TABLE_DIR/$tablename.meta"
        echo "Table $tablename created."
    fi
}

list_tables() {
    echo "Available Tables:"
    ls "$TABLE_DIR" | grep ".data" | sed 's/.data//'
}

drop_table() {
    read -p "Enter table name to delete: " tablename
    if [[ -f "$TABLE_DIR/$tablename.data" ]]; then
        rm "$TABLE_DIR/$tablename.data" "$TABLE_DIR/$tablename.meta"
        echo "Table $tablename deleted."
    else
        echo "Table does not exist!"
    fi
}

while true; do
    echo "=== Table Management ==="
    echo "1) Create Table"
    echo "2) List Tables"
    echo "3) Drop Table"
    echo "4) Back to Main Menu"

    read -p "Choose an option: " option
    case $option in
        1) create_table ;;
        2) list_tables ;;
        3) drop_table ;;
        4) break ;;
        *) echo "Invalid option. Try again." ;;
    esac
done
