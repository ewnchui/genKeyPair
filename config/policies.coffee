module.exports = 
	policies:
		CertController:
			'*':		false
			find:		['isAuth']
			findOne:	['isAuth']			
			create:		['isAuth', 'setCreatedBy']
		UserController:
			'*':		false
			find:		['isAuth']
			findOne:	['isAuth', 'user/me']			