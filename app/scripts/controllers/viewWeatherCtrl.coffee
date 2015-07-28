angular.module('App').controller 'viewWeather', ['Weather'
  (Weather) ->

    #set view model
    vm = this
    vm.loading = true;

    #autocomplete
    vm.searchText = ''

    #get weather data from getWeatherSrvc
    Weather.getWeather().then (response) ->

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
          if lastIndex
            lastDay = moment(list[lastIndex].dt, 'MMMM Do YYYY, h:mm A').format('Do')

          #create a new arraw if current day doesn't equal the last day
          if currentDay != lastDay
            byDay.push [time]
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
      vm.list = byDay
      vm.loading = false;
    return
]
