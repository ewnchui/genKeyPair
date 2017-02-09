env = require '../../env.coffee'
Promise = require 'bluebird'
forge = require 'forge'

describe 'model', ->
  createdBy = null
  cert = null

  it 'create user', ->
    sails.models.user
      .create
        email: 'user@abc.com'
      .then (user) ->
        createdBy = user
        
  it 'create cert', ->
    keys = forge.pki.generateKeyPair parseInt process.env.KEY_LEN
    sails.models.cert
      .create
        publicKey: keys.publicKey
        createdBy: createdBy
      .then (c) ->
        cert = c

  it 'delete cert', ->
    sails.models.cert
      .destroy cert
