#!/bin/bash

source ./scripts/database.sh


while true; do
    echo "=== Database Management System ==="
    echo "1) Create Database"
    echo "2) List Databases"
    echo "3) Connect to Database"
    echo "4) Drop Database"
    echo "5) Exit"
    
    read -p "Choose an option: " choice
    
    case $choice in
        1) create_database ;;
        2) list_databases ;;
        3) connect_database ;;
        4) drop_database ;;
        5) exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
done
