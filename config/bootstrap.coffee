fs = require 'fs'
Promise = require 'bluebird'
toString = Promise.promisify require 'stream-to-string'
forge = require 'node-forge'

module.exports =
  bootstrap: (cb) ->
    toString fs.createReadStream sails.config.pki.ca.keyFile
      .then (pem) ->
        sails.config.pki.ca.privateKey = forge.pki.privateKeyFromPem pem
        cb()
      .catch cb
