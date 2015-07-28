angular.module('App').factory 'Image', [
  '$http'
  ($http) ->
    image = (city, country) ->
      api_url = 'https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=ac2e2ea27cd77719248aab0439ea2bab&text=city+' + city + '+' + country + '&per_page=1&format=json&nojsoncallback=1'
      console.log api_url
      $http.get(api_url).success((data, status, headers, config) ->
        data.data
        console.log 'successfully got image data'
      ).error (data, status, headers, config) ->
        console.log 'error: getting image from http is broken'
        return
    { getImage: image }
]
