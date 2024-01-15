# Database Cleanup


Bash script [**cleanup_db.sh**] that resets a specified database environment using a function from an external file [**functions_db.sh**]. The [**functions_db.sh**] script assumes you are working with [**PostgreSQL**](https://www.postgresql.org/docs/current/sql-createdatabase.html) and that you have the necessary tools installed [e.g., **psql**]. Adjust the logic based on your specific database and requirements.

****
## Overview


The script checks for user confirmation before proceeding with the database reset and includes logic to drop and recreate the specified database environment. Customize the script further based on your specific requirements and database technology.

Make sure to replace placeholders like [your_db_host], [your_db_port], [your_db_user], [your_db_password], and [ENV_your_db_name_pattern] with your actual database connection details and naming conventions.


****
## Execute Script


Follow these steps to execute the script:

1. Create and add a file in your directory: [dbclean]
2. Passwords for psql connections
   - Add ~/.pgpass to the home directory with all passwords for db(s)
3. Update bash_profile with the path to the scripts folder:
   - Run `emacs .bash_profile` then `source .bash_profile`
4. Add path: `export SCRIPT_HOME=/Users/[user.name]/dbclean`
5. To execute the cleanup process in the [cleanup_db.sh] file without manual confirmation, particularly in CI/CD environments where automation is preferred, you may consider removing the user input prompt if it's not needed.


****
```bash
# Run the following commands in your terminal to make the scripts executable:

chmod +x cleanup_db.sh
chmod +x functions_db.sh


# Replace 'your_db_environment' with the actual 'environment name' and run:

'[ENV=your_db_environment]' ./cleanup_db.sh
'[ENV=waterfront_qa7_db]' ./cleanup_db.sh

# When you run this script with a command like [ENV=your_db_environment] ./cleanup_db.sh", it will clean the specified database environment, and then wait for user input before exiting.









