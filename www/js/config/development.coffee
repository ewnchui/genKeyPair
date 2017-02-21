io.sails.url = 'https://abc.com'
io.sails.path = "/im.app/socket.io"
io.sails.useCORSRouteToGetCookie = false

module.exports =
	isMobile: ->
		/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)
	isNative: ->
		/^file/i.test(document.URL)
	platform: ->
		if @isNative() then 'mobile' else 'browser'
	authUrl:	'https://abc.com'

	path: 'genkeypair'

	oauth2:
		authUrl: "#{@authUrl}/auth/oauth2/authorize/"
		opts:
			authUrl: "https://abc.com/auth/oauth2/authorize/"
			response_type:  "token"
			scope: 'User'
			client_id: 'genkeypairDEV'								
