agent = require 'https-proxy-agent'

module.exports =
	hookTimeout:	400000
	
	port:			1337

	oauth2:
		verifyURL:			"https://app.ogcio.gov.hk/auth/oauth2/verify/"
		tokenURL:			"https://app.ogcio.gov.hk/auth/oauth2/token/"
		scope: ['User']
						
	promise:
		timeout:	10000 # ms

	models:
		connection: 'mongo'
		migrate:	'alter'
	
	connections:
		mongo:
			adapter:	'sails-mongo'
			driver:		'mongodb'
			url: 'mongodb://todoactiviti_mongo/genKeyPair' #dev
						
	log:
		level: 'silly'
		
			