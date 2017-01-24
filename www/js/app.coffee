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
				
	.config ($stateProvider, $urlRouterProvider) ->
		$stateProvider.state 'app',
			url: ""
			abstract: true
			templateUrl: "templates/menu.html"
			
		$stateProvider.state 'app.genkeypair',
			url: "/genkeypair"
			cache: false
			views:
				'menuContent':
					templateUrl: "templates/genkeypair/create.html"
					controller: 'GenKeyPairCtrl'
			resolve:
				resources: 'resources'

		$stateProvider.state 'app.create',
			url: "/genkeypair/create"
			cache: false
			views:
				'menuContent':
					templateUrl: "templates/genkeypair/create.html"
					controller: 'CertCtrl'
			resolve:
				resources: 'resources'
				
				model: (resources) ->
					ret = new resources.Cert()	

		$stateProvider.state 'app.List',
			url: "/genkeypair/list"
			cache: false
			views:
				'menuContent':
					templateUrl: "templates/genkeypair/list.html"
					controller: 'ListCtrl'
			resolve:
				resources: 'resources'	
				collection: (resources) ->
					ret = new resources.CertList()
					ret.$fetch()					
					
		$urlRouterProvider.otherwise('/genkeypair/list')