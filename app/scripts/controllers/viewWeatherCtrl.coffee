angular.module('App').controller 'viewWeather', ['Weather', 'Image'
  (Weather, Image) ->

    #set view model
    vm = this
    vm.loading = true;
    vm.searchFocus = false;

    #function to manipulate weather data recieved
    setWeatherData = (response) ->
      #variable declarations
      list = response.data.list
      byDay = []
      dayNumber = 0

      #looping through each item in the weather data
      for time, index in list
        do (time) ->

          #set a variable for the last index when it exists
          if index > 0
            lastIndex = index - 1;

          #get formatted dates
          currentDay = moment(list[index].dt, 'X').format('Do');
          currentDate = moment(list[index].dt, 'X').format('MMMM Do');
          currentHour = moment(list[index].dt, 'X').format('h:mm A');
          time.hour = currentHour;
          if index > 0
            lastDay = moment(list[lastIndex].dt, 'MMMM Do YYYY, h:mm A').format('Do')

          #create a new arraw if current day doesn't equal the last day
          if currentDay != lastDay
            byDay.push [time]
            console.log 'currentDay = ', currentDay, ' | lastDay = ', lastDay
            if index > 0
              dayNumber++
            byDay[dayNumber].day = currentDate;

          #push time to current day's array if this day is equal to the last day
          if lastIndex && currentDay == lastDay
            byDay[dayNumber].push time

          #format data to be readable
          time.dt = moment(time.dt, 'X').format('MMMM Do YYYY, h:mm A')
          Farenheight = Math.round(time.main.temp * 9 / 5 - 459.67)
          time.main.temp = Farenheight

      #view model data
      vm.city = response.data.city.name
      vm.country = response.data.city.country
      vm.list = byDay
      vm.loading = false;
      console.log byDay
      console.log response.data.list
    setImageData = (response) ->
      image_farm = response.data.photos.photo[0].farm
      image_server = response.data.photos.photo[0].server
      image_id = response.data.photos.photo[0].id
      image_secret = response.data.photos.photo[0].secret
      image_url = 'https://farm'+image_farm+'.staticflickr.com/'+image_server+'/'+image_id+'_'+image_secret+'.jpg'
      vm.setBackground = { 'background-image' : 'url("'+image_url+'")' }
      console.log vm.setBackground

    #initialize with Austin
    searchText = 'Austin'

    #get weather data from getWeatherSrvc
    Weather.getWeather(searchText).then (response) ->
      setWeatherData response
      #get image data from getImageSrvc
      Image.getImage(vm.city, vm.country).then (response) ->
        setImageData response
        return
      return

    #search for city
    vm.toggleSearch = ->
      vm.search = !vm.search
      if(vm.search)
        vm.searchFocus = true
      else
        vm.searchFocus = false
      return

    vm.search = false;
    vm.searchInput = ''
    vm.searchCity = (input) ->
      searchText = input
      Weather.getWeather(searchText).then (response) ->
        setWeatherData response
        Image.getImage(vm.city, vm.country).then (response) ->
          setImageData response
          return
        return
      vm.searchInput = ''
      vm.toggleSearch()
    return
]
