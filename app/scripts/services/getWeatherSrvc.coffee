angular.module('App').factory 'Weather', [
  '$http'
  ($http) ->
    weather = ->
      $http.get('http://api.openweathermap.org/data/2.5/forecast?q=Austin,US').success((data, status, headers, config) ->
        data.data
      ).error (data, status, headers, config) ->
        console.log 'error: getting weather from http is broken'
        return
    { getWeather: weather }
]
