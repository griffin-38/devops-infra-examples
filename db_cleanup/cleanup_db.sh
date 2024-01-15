#!/bin/bash

echo "cleaning your requested ENVIRONMENT: $ENV"

source ./functions_db.sh

reset_db $ENV

# To execute the cleanup process without manual confirmation, such as in CI/CD environments where automation is preferred.
read -n1 -p "Press any key to continue..."


# run: ENV=waterfront_qa7_db ./cleanup_db.sh
# reset_db waterfront_qa2_db
# reset_db waterfront_qa3_db
# reset_db waterfront_qa5_db
# reset_db waterfront_qa6_db
# reset_db waterfront_qa7_db
# cd $SCRIPT_HOME

