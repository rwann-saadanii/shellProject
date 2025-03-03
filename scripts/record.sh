#!/bin/bash

TABLE_DIR=$1

insert_record() {
    read -p "Enter table name: " tablename
    if [[ ! -f "$TABLE_DIR/$tablename.data" ]]; then
        echo "Table does not exist!"
        return
    fi

    read -p "Enter record values (comma-separated): " record
    echo "$record" >> "$TABLE_DIR/$tablename.data"
    echo "Record inserted."
}

select_records() {
    read -p "Enter table name: " tablename
    if [[ -f "$TABLE_DIR/$tablename.data" ]]; then
        column -t -s, "$TABLE_DIR/$tablename.data"
    else
        echo "Table does not exist!"
    fi
}

delete_record() {
    read -p "Enter table name: " tablename
    if [[ ! -f "$TABLE_DIR/$tablename.data" ]]; then
        echo "Table does not exist!"
        return
    fi

    read -p "Enter value to delete (exact match): " value
    grep -v "$value" "$TABLE_DIR/$tablename.data" > temp && mv temp "$TABLE_DIR/$tablename.data"
    echo "Record deleted if found."
}

update_record() {
    read -p "Enter table name: " tablename
    if [[ ! -f "$TABLE_DIR/$tablename.data" ]]; then
        echo "Table does not exist!"
        return
    fi

    read -p "Enter value to update: " oldvalue
    read -p "Enter new value: " newvalue
    sed -i "s/$oldvalue/$newvalue/g" "$TABLE_DIR/$tablename.data"
    echo "Record updated."
}

while true; do
    echo "=== Record Management ==="
    echo "1) Insert Record"
    echo "2) Select Records"
    echo "3) Delete Record"
    echo "4) Update Record"
    echo "5) Back to Table Menu"

    read -p "Choose an option: " option
    case $option in
        1) insert_record ;;
        2) select_records ;;
        3) delete_record ;;
        4) update_record ;;
        5) break ;;
        *) echo "Invalid option. Try again." ;;
    esac
done
