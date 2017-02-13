env = require '../../env.coffee'
Promise = require 'bluebird'
forge = require 'node-forge'

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
    keys = forge.pki.rsa.generateKeyPair parseInt process.env.KEY_LEN
    publicKey = forge.pki.publicKeyToPem keys.publicKey
    sails.models.cert
      .create
        publicKey: publicKey
        createdBy: createdBy
      .then (c) ->
        cert = c

  it 'delete cert', ->
    sails.models.cert
      .destroy id: cert.id
      .toPromise()

  it 'delete user', ->
    sails.models.user
      .destroy email: createdBy.email
      .toPromise()
