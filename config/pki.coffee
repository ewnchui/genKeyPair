[ 'CA_KEY', 'CA_CRT' ].map (name) ->
  if not (name of process.env)
    throw new Error "process.env.#{name} not yet defined"

module.exports =
  pki:
    ca:
      keyFile: process.env.CA_KEY
      crtFile: process.env.CA_CRT
