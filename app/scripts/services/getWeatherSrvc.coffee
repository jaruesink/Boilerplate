angular.module('App').factory 'Weather', [
  '$http'
  ($http) ->
    weather = (searchCity) ->
      $http.get('http://api.openweathermap.org/data/2.5/forecast?q='+searchCity).success((data, status, headers, config) ->
        data.data
        # console.log 'successfully got weather data'
      ).error (data, status, headers, config) ->
        console.log 'error: getting weather from http is broken'
        return
    { getWeather: weather }
]
