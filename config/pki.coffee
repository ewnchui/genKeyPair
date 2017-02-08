[ 'CA_KEY' ].map (name) ->
  if not (name of process.env)
    throw new Error "process.env.#{name} not yet defined"

modules =
  pki:
    ca:
      keyFile: process.env.CA_KEY
