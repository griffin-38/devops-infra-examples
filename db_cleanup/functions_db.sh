#!/bin/bash

# Function to reset the specified database environment
reset_db() {
    local ENV=$1

    # Database connection details
    DB_HOST="your_db_host"
    DB_PORT="your_db_port"
    DB_USER="your_db_user"
    DB_PASSWORD="your_db_password"

    # Your database name pattern (replace [ENV] with the actual pattern)
    DB_NAME_PATTERN="your_db_name_pattern_$ENV"

    # Prompt to confirm before proceeding
    read -p "This will reset the database for environment '$ENV'. Do you want to continue? (y/n): " confirm
    if [ "$confirm" != "y" ]; then
        echo "Operation aborted."
        exit 1
    fi

    # Drop and recreate the database
    echo "Dropping and recreating the database for environment: $ENV"
    psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d postgres -c "DROP DATABASE IF EXISTS $DB_NAME_PATTERN;"
    psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d postgres -c "CREATE DATABASE $DB_NAME_PATTERN;"

    # Add your additional logic for database initialization or seed data
    # For example, you might run SQL scripts to populate initial data

    echo "Database reset completed for environment: $ENV"
}

# Check if environment variable is provided
if [ -z "$ENV" ]; then
    echo "Please provide the environment variable [ENV=your_db_environment] when running the script."
    exit 1
fi

# Example usage
reset_db "$ENV"


