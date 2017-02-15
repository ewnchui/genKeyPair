env = require '../../env.coffee'
req = require 'supertest-as-promised'
oauth2 = require 'oauth2_client'
Promise = require 'bluebird'
forge = require 'node-forge'

describe 'controller', ->
  token = null
  certs = null
  yesterday = new Date()
  yesterday.setDate yesterday.getDate() - 1
  tomorrow = new Date()
  tomorrow.setDate tomorrow.getDate() + 1

  before ->
    oauth2
      .token env.tokenUrl, env.client, env.user, env.scope
      .then (t) ->
         token = t

  it 'create', ->
    keys = forge.pki.rsa.generateKeyPair parseInt process.env.KEY_LEN
    publicKey = forge.pki.publicKeyToPem keys.publicKey
    data = [
      {publicKey: publicKey}
      {publicKey: publicKey, notBefore: tomorrow}
      {publicKey: publicKey, notBefore: yesterday, notAfter: yesterday}
    ]
    Promise
      .map data, (record) ->
        req sails.hooks.http.app
          .post '/api/cert'
          .set 'Authorization', "Bearer #{token}"
          .send record
          .expect 201
          .then (res) ->
            res.body
      .then (c) ->
        certs = c

  it 'find', ->
    req sails.hooks.http.app
      .get '/api/cert'
      .expect 200

  it 'findOne', ->
    req sails.hooks.http.app
      .get "/api/cert/#{certs[0].id}"
      .expect 200
