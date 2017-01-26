module.exports = 
	policies:
		CertController:
			'*':		false
			find:		['isAuth', 'genkeypair/resolveMe']
			findOne:	['isAuth']			
			create:		['isAuth', 'setCreatedBy', 'setExpiryDate']
		UserController:
			'*':		false
			find:		['isAuth']
			findOne:	['isAuth', 'user/me']			