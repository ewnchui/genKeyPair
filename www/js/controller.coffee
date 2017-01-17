env = require './env.coffee'
Promise = require 'promise'

angular
	.module 'starter.controller', ['ionic', 'ngCordova', 'http-auth-interceptor', 'starter.model', 'platform']		
	.controller 'MenuCtrl', ($scope) ->
		$scope.env = env
		$scope.navigator = navigator
		
	.controller 'GenKeyPairCtrl', ($scope, collection, $location, resources, userList) ->
		_.extend $scope,
			test: 'testing'

