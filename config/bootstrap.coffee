fs = require 'fs'
Promise = require 'bluebird'
toString = Promise.promisify require 'stream-to-string'
forge = require 'node-forge'

module.exports =
  bootstrap: (cb) ->
    Promise
      .all [
        toString fs.createReadStream sails.config.pki.ca.keyFile
        toString fs.createReadStream sails.config.pki.ca.crtFile
      ]
      .then (keys) ->
        sails.config.pki.ca.privateKey = forge.pki.privateKeyFromPem keys[0]
        sails.config.pki.ca.certificate = forge.pki.certificateFromPem keys[1]
        cb()
      .catch cb
