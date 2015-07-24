angular.module 'App', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngSanitize',
    'ngTouch',
    'ui.router',
    'ngMaterial'
  ]

angular.module 'App'
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider
    .state 'index',
      url: ""
      templateUrl: "views/main.html"
