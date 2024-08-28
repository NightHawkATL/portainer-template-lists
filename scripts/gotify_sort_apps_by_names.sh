#!/bin/bash

# Define the database file path
DB_PATH="gotify.db"

# Step 1: Rename the current applications table to applications_old
sqlite3 "$DB_PATH" "ALTER TABLE applications RENAME TO applications_old;"

# Step 2: Create a new applications table with the same schema
sqlite3 "$DB_PATH" "CREATE TABLE applications (id INTEGER PRIMARY KEY AUTOINCREMENT, token VARCHAR(180), user_id INTEGER, name TEXT, description TEXT, internal BOOL, image TEXT, default_priority INTEGER, last_used DATETIME);"

# Step 3: Insert sorted data from applications_old into the new applications table with updated IDs
sqlite3 "$DB_PATH" "INSERT INTO applications (id, token, user_id, name, description, internal, image, default_priority, last_used) SELECT ROW_NUMBER() OVER (ORDER BY name), token, user_id, name, description, internal, image, default_priority, last_used FROM applications_old;"

# Step 4: Drop the applications_old table
sqlite3 "$DB_PATH" "DROP TABLE applications_old;"

echo "Applications table IDs updated successfully."
