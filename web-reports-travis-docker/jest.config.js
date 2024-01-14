module.exports = {
  collectCoverageFrom: [
    'api/**/*.{js,jsx,mjs}',
    'components/**/*.{js,jsx,mjs}',
    'utils/**/*.{js,jsx,mjs}',
  ],
  coverageThreshold: {
    global: {
      statements: 90,
      branches: 90,
      functions: 90,
      lines: 90,
    },
  },
  moduleNameMapper: {
    '^.+\\.(css|less)$': '<rootDir>/__mocks__/cssStub.js',
  },
  setupFiles: ['jest-prop-type-error', 'jest-localstorage-mock'],
  setupFilesAfterEnv: ['<rootDir>/jest/setupTests.js'],
  testURL: 'http://localhost',
  testMatch: [
    '<rootDir>/**/__tests__/**/*.{js,jsx,mjs}',
    '<rootDir>/**/?(*.)(spec|test).{js,jsx,mjs}',
  ],
  testPathIgnorePatterns: [
    '<rootDir>/.next/',
    '<rootDir>/coverage/',
    '<rootDir>/static/',
    '/node_modules/',
  ],
  coveragePathIgnorePatterns: [
    // No Logic To Test
    '/__data__/',
    'api/setDefaults.js',
  ],
  transform: {
    '^.+\\.(js|jsx|mjs)$': 'babel-jest',
    '^(?!.*\\.(js|jsx|mjs|css|json)$)': '<rootDir>/jest/fileTransform.js',
  },
  verbose: false,
};
