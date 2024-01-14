#!/bin/bash

echo "cleaning your requested ENVIRONMENT: $ENV"

source ./functions_db.sh

reset_db $ENV

read -n1 -p "Press any key to continue..."

# add file in directory: [dbclean]
# type command line: chmod +x [filename] or chmod +x *.sh 
# add ~/.pgpass to home directory with all passwords for db(s)
# passwords for psql connections
# update bash_profile with path to scripts folder 
# emacs .bash_profile then source .bash_profile
# add path: export SCRIPT_HOME=/Users/[user.name]/Documents/Repos/dbclean

# run: ENV=waterfront_qa7_db ./cleanup_db.sh
# reset_db waterfront_qa2_db
# reset_db waterfront_qa3_db
# reset_db waterfront_qa5_db
# reset_db waterfront_qa6_db
# reset_db waterfront_qa7_db
# cd $SCRIPT_HOME
