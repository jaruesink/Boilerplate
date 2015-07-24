angular.module('App').controller 'viewWeather', ['Weather'
  (Weather) ->
    vm = this
    Weather.getWeather().then (response) ->
      vm.data = response.data
      vm.city = response.data.city.name
      vm.list = response.data.list
    return
]
