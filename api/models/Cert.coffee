addr = require 'email-addresses'

['COUNTRY', 'YEAR_EXPIRE'].map (name) ->
  if not (name of process.env)
    throw new Error "process.env.${name} not yet defined"

module.exports =
  tableName: 'cert'

  schema: true

  attributes:
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
        ret.setFullYear ret.getFullYear() + process.env.YEAR_EXPIRE
        
    createdBy:
      model: 'user'
      required: true

    toJSON: ->
      ret = @toObject()
      parts = addr.parseOneAddress @createdBy
      cn = @createdBy
      c = process.env.COUNTRY
      o = parts.domain
      email = @createdBy
