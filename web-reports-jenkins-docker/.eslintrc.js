'use strict';

module.exports = {
  extends: ['@autogravity/eslint-config-autogravity-web'],

  // These are unique to the application.
  // Other plugins are used in this eslint config, but imported within the config package.
  plugins: ['emotion', 'prettier', 'react-hooks', 'lodash', 'no-only-tests'],

  globals: {
    React: true,
  },

  settings: {
    'import/resolver': {
      'babel-module': {
        root: './',
        alias: {
          '~': './',
        },
      },
    },
  },

  // turn off rules that conflict with Prettier
  rules: {
    quotes: 0,
    semi: 0,
    'comma-dangle': 0,
    'import/no-nodejs-modules': 'error',
    'import/no-restricted-paths': [
      'error',
      { zones: [{ target: '*', from: 'lodash' }] },
    ],
    'jsx-a11y/anchor-is-valid': [
      'error',
      {
        components: ['Link'],
        specialLink: ['hrefLeft', 'hrefRight'],
        aspects: ['invalidHref', 'preferButton'],
      },
    ],
    'lodash/import-scope': ['error', 'method'],
  },

  overrides: [
    {
      files: ['**/index.js', 'store/**'],
      rules: {
        'import/prefer-default-export': 0,
      },
    },
    {
      files: ['jest/*', 'next.config.js'],
      rules: {
        'import/no-nodejs-modules': 'off',
      },
    },
    {
      files: ['server/**/*', 'utils/**/*'],
      rules: {
        'react-hooks/rules-of-hooks': 'off',
      },
    },
  ],
};
