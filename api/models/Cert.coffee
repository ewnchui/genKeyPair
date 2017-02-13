addr = require 'email-addresses'
forge = require 'node-forge'

['COUNTRY', 'YEAR_EXPIRE', 'CA_KEY'].map (name) ->
  if not (name of process.env)
    throw new Error "process.env.${name} not yet defined"

module.exports =
  tableName: 'cert'

  schema: true

  attributes:
    pem:
      type: 'string'

    publicKey:
      type: 'string'
      required: true  

    notBefore:
      type: 'datetime'
      defaultsTo: ->
        new Date()

    notAfter:
      type: 'datetime'
      defaultsTo: ->
        ret = new Date()
        ret.setFullYear ret.getFullYear() + parseInt process.env.YEAR_EXPIRE
        ret
        
    createdBy:
      model: 'user'
      required: true

  afterCreate: (record, cb) ->
    parts = addr.parseOneAddress record.createdBy
    crt = _.extend forge.pki.createCertificate(),
      publicKey: forge.pki.publicKeyFromPem record.publicKey
      serialNumber: record.id
      validity:
        notBefore: record.notBefore
        notAfter: record.notAfter
    crt.setSubject [
      {name: 'commonName', value: record.createdBy}
      {name: 'countryName', value: process.env.COUNTRY}
      {name: 'organizationName', value: parts.domain}
      {name: 'emailAddress', value: record.createdBy}
    ]
    crt.setIssuer sails.config.pki.ca.certificate.subject.attributes
    crt.sign sails.config.pki.ca.privateKey, forge.md.sha256.create()
    sails.models.cert
      .update record, pem: forge.pki.certificateToPem crt
      .then ->
        cb()
      .catch cb
