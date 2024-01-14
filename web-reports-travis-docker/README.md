# Web Reports

Provides an easy and scalable way to store and visualize internal reports.
Based on [next.js](https://nextjs.org/) with [express server](https://expressjs.com/). Stores data in [mongoDB](https://www.mongodb.com/).

## Documentation

* [Web Reports](https://autogravity.atlassian.net/wiki/spaces/OP/pages/825950214/Web-Reports)
  * [Target Dealers Inventory](https://autogravity.atlassian.net/wiki/spaces/OP/pages/822640670/Target+Dealers+Inventory+Report)
  * [Dealer Service Tracker](https://autogravity.atlassian.net/wiki/spaces/OP/pages/825982990/Dealer+Service+Tracker)

### NPM Token

See [this Confluence doc](https://autogravity.atlassian.net/wiki/spaces/EN/pages/637534393/Deploying+with+npm+Private+Modules) on integrating your NPM token via `.env`

### Authentication

The application is using OneLogin SSO for authentication. When running locally, it connects to [web-reports local](https://autogravity-dev.onelogin.com/apps/955660/edit). You may need to request access to https://autogravity-dev.onelogin.com.

## How to use

- git clone this repo
- follow instructions in NPM Token section to generate your own `NPM_TOKEN`
- `yarn` to install all the dependencies locally

- `yarn dev` to run the development version accessible from your localhost
- `yarn build & yarn start` to run the production version

## Set up MongoDB

- `brew install mongodb` to install all MongoDB binaries
- `mkdir -p /data/db` - to create the data directory
- Before running [mongod](https://docs.mongodb.com/manual/reference/program/mongod/#bin.mongod) for the first time, ensure that the user account running `mongod` has read and write permissions for the directory
- `mongod` to run MongoDB

You can use [MongoDB Compass](https://www.mongodb.com/download-center/compass) to query data.

## Environment Variables and Config

This application leverages [dotenv](https://www.npmjs.com/package/dotenv) to handle configuration based on environment variables. When you start work on this project, you need to create a `.env` file that holds all your environment variables used for local dev:

```
HOST = http://localhost
PORT = 9000
LOG_LEVEL=debug
MONGO_URL = mongodb://localhost:27017
AG_MONGO_URL = mongodb://127.0.0.1:50001/admin
SQL_HOST = staging-cluster.cluster-catsscd1f7rv.us-west-2.rds.amazonaws.com
DB_USERNAME = developer
DB_PASSWORD = password
PROD_SSH_HOST = prod-jumpbox.autogravity.com
SSH_HOST = staging-jumpbox.autogravity.com
SSH_PORT = 22
SSH_DST_HOST = 172.16.1.137
SSH_DST_PORT = 27017
SSH_LOCAL_HOST = 127.0.0.1
SSH_LOCAL_PORT = 50001
SSH_LOCAL_PORT_REDSHIFT = 50002
OIDC_CLIENT_ID=225baa90-8007-0137-2e50-0adbaaa8d632135512
OIDC_CLIENT_SECRET=3a19438c273bf9531bb802435c74130bb415334f94692994f3af3ce94769f362
OIDC_REDIRECT_URI=http://localhost:9000/oauth/callback
NODE_ENV = dev
ES_INVENTORY_URL = https://staging-inventory-es.autogravity.com
REDSHIFT_URL = prod-redshift.cg7s7vvkmjmw.us-west-2.redshift.amazonaws.com
REDSHIFT_DB = prod
REDSHIFT_PORT = 5439
REDSHIFT_USER =
REDSHIFT_PASSWORD =
TABLEAU_URL = https://tableau.autogravity.com
TABLEAU_USERNAME =
TABLEAU_PASSWORD =
INVENTORY_VALIDATION_URL = https://autogravity.atlassian.net/wiki/spaces/EN/pages/754286752/Inventory+Failed+Validation
```

Be sure to add a PASSPHRASE into your .env IF you have one.

```
PASSPHRASE = whateveryourpassphraseis
```

You may also need to add `REDSHIFT_USER` and `REDSHIFT_PASSWORD` to run dealers-opportunities report.

*Deprecated*: Tableau api require authentication with `TABLEAU_USERNAME` and `TABLEAU_PASSWORD`.

## Linting and Formatting

Linting dependencies and config provided by [@autogravity/eslint-config-autogravity-web](https://github.com/AutoGravity/web-core/tree/master/packages/eslint-config-autogravity-web). It's recommended that you install any editor plugins that live lint/format based on these configs. For Visual Studio Code users, see https://github.com/AutoGravity/web-core#visual-studio-code-users for recommended plugins and settings.

Husky / lint-staged are also enabled to format code pre-commit.

For more information, see [Linting, Formatting and Coding Style](https://autogravity.atlassian.net/wiki/spaces/EN/pages/565706780/Linting+Formatting+and+Coding+Style).

## JSON api

The following routes are served with express:

- *GET* `/api/auth/profile` - gets user info
- *GET* `/api/reports/inventory/latest` - get the latest inventory report
- *GET* `/api/reports/inventory/:id` - get inventory report by id
- *GET* `/api/reports/inventory` - get all inventory reports
- *POST* `/api/reports/inventory` - create new inventory report
- *GET* `/api/reports/inventory/errors/:reportId` - get inventory errors by report id
- *POST* `/api/reports/inventory/errors` - create new inventory inventory errors report
- *GET* `/api/reports/third-party-inventory/latest` - get the latest inventory report from dealers websites
- *GET* `/api/reports/third-party-inventory/:id` - get inventory report by id from dealers websites
- *GET* `/api/reports/third-party-inventory` - get all inventory reports from dealers websites
- *POST* `/api/reports/third-party-inventory` - create new inventory report from dealers websites
- *GET* `/api/reports/target-dealers-inventory/latest` - get the latest inventory report
- *GET* `/api/reports/target-dealers-inventory/:id` - get inventory report by id
- *GET* `/api/reports/target-dealers-inventory` - get all inventory reports
- *POST* `/api/reports/target-dealers-inventory` - create new inventory report
- *POST* `/api/reports/target-dealers-inventory/errors:reportId` - get inventory errors for target dealers
- *POST* `/api/reports/target-dealers-inventory/create` - generates a report on the backend
- *DELETE* `/api/reports/target-dealers-inventory/cleanup` - removes stuck *Processing* reports
- *GET* `/api/reports/dealers-financial/latest` - returns the latest dealers financial report
- *GET* `/api/reports/dealers-opportunities/latest` - get the latest dealers opportunities report
- *GET* `/api/reports/dealers-opportunities/:id` - get dealers opportunities report by id
- *GET* `/api/reports/dealers-opportunities` - get all dealers opportunities reports
- *POST* `/api/reports/dealers-opportunities` - create new dealers opportunities report
- *POST* `/api/reports/dealers-opportunities/create` - generates a report on the backend
- *GET* `/api/reports/dealers-websites/latest` - get the latest dealers websites report
- *GET* `/api/reports/dealers-websites/:id` - get dealers websites report by id
- *GET* `/api/reports/dealers-websites` - get all dealers websites reports
- *POST* `/api/reports/dealers-websites` - create new dealers websites report
- *GET* `/api/reports/inventory-trend/latest` - get the latest inventory trend report
- *GET* `/api/reports/inventory-trend/:id` - get inventory trend report by id
- *GET* `/api/reports/inventory-trend` - get all inventory trend reports
- *POST* `/api/reports/inventory-trend` - create new inventory trend report
- *GET* `/api/utils/dealers` - *AUTH REQUIRED* - get all dealer configs
- *GET* `/api/utils/dealers/ids` - get all dealer ids
- *POST* `/api/utils/dealers` - *AUTH REQUIRED* - create a new dealer config
- *POST* `/api/utils/dealers/sync` - adds new signed dealers from redshift and updates existing
- *PUT* `/api/utils/dealers/:id` - *AUTH REQUIRED* - update an existing dealer config by id
- *DELETE* `/api/utils/dealers/:id` - *AUTH REQUIRED* - delete a dealer config by id
- *GET* `/api/ag/ims/inventory/errors/:dealerId` - get all recent inventory errors of a dealer by id
- *POST* `/api/ag/dms/dealers` - *AUTH REQUIRED* - searches for dealer names by partial match
- *POST* `/api/leads` - *AUTH REQUIRED* - unique dealer leads by type and date range
