var fs = require('fs');
var expandHomeDir = require("expand-home-dir");

module.exports = {
  'staging': {
    'agGatewayHost': 'newapi-staging.autogravity.com',
    'agGatewayPort': 443,
    'agGatewayProtocol': 'https',
    'agInternalGatewayHost': 'newapi-staging.internal.autogravity.com',
    'agInternalGatewayPort': 443,
    'agInternalGatewayProtocol': 'https',
    'agUtilityHost': 'staging-jumpbox.autogravity.com',
    'agUtilityPort': 22,
    'eventsHost': 'https://ee-staging.autogravity.com',
    'dbHost': '127.0.0.1',
    'dbUsername': 'developer',
    'dbPassword': 'password',
    'dbPort': 3306,
    'sqlHost':  'staging-cluster.cluster-catsscd1f7rv.us-west-2.rds.amazonaws.com',
    'sshHost': 'staging-jumpbox.autogravity.com',
    'sshUser': 'omar',
    'sshPort': 22,
    'privateKey': fs.readFileSync(expandHomeDir("~/.ssh/id_rsa")),
  }
};