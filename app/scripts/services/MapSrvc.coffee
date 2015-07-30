angular.module('App').factory 'Map', [
  '$http'
  ($http) ->
    getImage = (city) ->
      api_url = 'https://maps.googleapis.com/maps/api/staticmap?center='+city+'&zoom=10&size=640x300&scale=2'
      return api_url
    { image: getImage }
]
