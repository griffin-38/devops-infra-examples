require('dotenv').config();
const withCSS = require('@zeit/next-css');
const camelCase = require('lodash/camelCase');

// Create publicRuntimeConfig which allows us to import .env config anywhere in our project. See https://github.com/zeit/next.js/#exposing-configuration-to-the-server--client-side
const makePublicRuntimeConfig = () => {
  return Object.entries(process.env).reduce((acc, curr) => {
    const [key, val] = curr;
    acc[camelCase(key)] = val;

    return acc;
  }, {});
};

const initConfig = {
  publicRuntimeConfig: makePublicRuntimeConfig(),
  useFileSystemPublicRoutes: false,
};

module.exports = withCSS(initConfig);

module.exports.makePublicRuntimeConfig = makePublicRuntimeConfig;
