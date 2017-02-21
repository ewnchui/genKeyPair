io.sails.url = 'https://abc.com'
io.sails.path = "/genkeypair/socket.io"
io.sails.useCORSRouteToGetCookie = false

module.exports =
	isMobile: ->
		/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)
	isNative: ->
		/^file/i.test(document.URL)
	platform: ->
		if @isNative() then 'mobile' else 'browser'
	authUrl:	'https://abc.com'

	serverUrl: (path = @path) ->
		"https://abc.com/#{@path}"
	path: 'genkeypair'		
	server:
		rest:
			urlRoot:	'https://abc.com/org'
		io:
			urlRoot:	'https://abc.com/im.app'
	oauth2:
		opts:
			authUrl: "https://abc.com/org/oauth2/authorize/"
			response_type:	"token"
			scope:			"https://abc.com/org/users"
			client_id:		'genkeypair.uat'
