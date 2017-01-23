env = require './env.coffee'
Promise = require 'promise'
keypair = require 'keypair'
fs = require 'fs'

angular
	.module 'starter.controller', ['ionic', 'ngCordova', 'http-auth-interceptor', 'starter.model', 'platform']		
	.controller 'MenuCtrl', ($scope) ->
		$scope.env = env
		$scope.navigator = navigator
		
	.controller 'GenKeyPairCtrl', ($scope, $log) ->
		
		pair = keypair()
		file = 'privatekey.pem'
		
		opts = 
			persistent:		true
			storageSize:	1024 * 1024 * 1024 # storage size in bytes
			concurrency:	3 # how many concurrent uploads/downloads?
			Promise: 		require 'bluebird'
		
		fileExist = (path) ->
			new Promise (resolve, reject) ->	
				fs = CordovaPromiseFS opts
					
				fs.exists(path)
					.catch (err) ->
						if err.code == 8
							Promise.resolve true
						else
							Promise.reject err
		
		value = fileExist(file)
	
		
		_.extend $scope,
			pair: keypair()
