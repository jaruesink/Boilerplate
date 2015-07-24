App = angular.module 'App', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngTouch',
    'ui.router',
    'ngMaterial',
  ]

App.config ($stateProvider, $urlRouterProvider) ->
  $stateProvider
  .state 'index',
    url: ""
    templateUrl: "views/main.html"
