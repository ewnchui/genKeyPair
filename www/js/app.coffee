env = require './env.coffee'

angular.module 'starter', ['ionic', 'starter.controller', 'starter.model', 'ActiveRecord', 'angular.filter', 'util.auth']

	.run (authService) ->
		authService.login env.oauth2.opts
		
	.run ($rootScope, platform, $ionicPlatform, $location, $http) ->
		$ionicPlatform.ready ->
			if (window.cordova && window.cordova.plugins.Keyboard)
				cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true)
			if (window.StatusBar)
				StatusBar.styleDefault()								
	.run (editableOptions) ->
		editableOptions.theme = 'bs3'
	.config ($stateProvider, $urlRouterProvider) ->
		$stateProvider.state 'app',
			url: ""
			abstract: true
			templateUrl: "templates/menu.html"

		$stateProvider.state 'app.genKeyPair',
			url: "/genKeyPair"
			cache: false
			views:
				'menuContent':
					templateUrl: "templates/keyPair/list.html"
					controller: 'GenKeyPairCtrl'
			resolve:
				resources: 'resources'

		$urlRouterProvider.otherwise('/genKeyPair')