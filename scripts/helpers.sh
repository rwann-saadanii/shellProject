#!/bin/bash

# Validate if a string is a number
is_number() {
    [[ "$1" =~ ^[0-9]+$ ]]
}

# Validate if a string contains only letters
is_alpha() {
    [[ "$1" =~ ^[a-zA-Z]+$ ]]
}

# Validate if a string is alphanumeric
is_alphanumeric() {
    [[ "$1" =~ ^[a-zA-Z0-9_]+$ ]]
}

# Check if a table exists in the given database
table_exists() {
    local table_name=$1
    local db_path=$2
    [[ -f "$db_path/$table_name.data" ]]
}

# Check if a database exists
database_exists() {
    local db_name=$1
    [[ -d "./databases/$db_name" ]]
}

# Display formatted output
print_header() {
    echo "=============================="
    echo "$1"
    echo "=============================="
}

# Prompt for confirmation
confirm_action() {
    read -p "Are you sure? (y/n): " choice
    case "$choice" in
        y|Y) return 0 ;;
        n|N) return 1 ;;
        *) echo "Invalid choice, assuming 'No'"; return 1 ;;
    esac
}
