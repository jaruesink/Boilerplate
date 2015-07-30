angular.module 'App', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngTouch',
    'ui.router',
    'ngMaterial',
  ]

angular.module('App').config ($stateProvider, $urlRouterProvider) ->

  $urlRouterProvider.otherwise '/weather'

  $stateProvider
  .state 'home',
    url: '/weather'
    templateUrl: 'views/main.html'
    controller: 'WeatherCtrl as weather'
  .state 'home.settings',
    url: '/settings'
    templateUrl: 'views/settings.html'
    contoller: 'SettingsCtrl as settings'
