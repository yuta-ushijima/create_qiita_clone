'use strict'
const merge = require('webpack-merge')
const devEnv = require('./dev.env')

module.exports = merge(devEnv, {
  NODE_ENV: '"testing"',
  DOMAIN_BASE: "http://localhost:3000/api/v1/",
  SIGNUP_ENDPOINT: '"http://localhost:3000/api/v1/users"',
  ARTICLES_ENDPOINT: '"http://localhost:3000/api/v1/articles"'
})
