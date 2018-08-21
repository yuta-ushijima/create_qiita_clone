'use strict'
const merge = require('webpack-merge')
const prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: "'development'",
  DOMAIN_BASE: "'http://localhost:3000/api/v1/'",
  SIGNUP_ENDPOINT: "'http://localhost:3000/api/v1/users'",
  ARTICLES_ENDPOINT: "'http://localhost:3000/api/v1/articles'"
})
