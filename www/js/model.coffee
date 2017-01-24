env = require './env.coffee'
require 'PageableAR'

angular.module 'starter.model', ['PageableAR']
	
	.factory 'resources', (pageableAR, $filter, $http) ->

		class User extends pageableAR.Model
			$idAttribute: 'username'
			
			$urlRoot: "api/user"
			
			_me = null
			
			@me: ->
				_me ?= new User username: 'me'
		
		# UserList
		class UserList extends pageableAR.PageableCollection

			model: User
			
			$urlRoot: "api/user"
			
		class Cert extends pageableAR.Model
			$idAttribute: 'id'
			
			$urlRoot: "api/cert"
		
		# CertList
		class CertList extends pageableAR.PageableCollection
			model: Cert
		
			$urlRoot: "api/cert"	

		
		User:		User
		Users:		UserList
		Cert:		Cert
		CertList:	CertList
		