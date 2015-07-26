angular.module('App').controller 'viewWeather', ['Weather'
  (Weather) ->

    #set view model
    vm = this

    #get weather data from getWeatherSrvc
    Weather.getWeather().then (response) ->

      #variable declarations
      list = response.data.list
      byDay = []
      dayNumber = 0

      #looping through each item in the weather data
      for time, index in list
        do (time) ->

          #get current day and hour
          currentDay = moment(list[index].dt, 'X').format('Do');
          currentDate = moment(list[index].dt, 'X').format('MMMM Do');
          currentHour = moment(list[index].dt, 'X').format('h:mm A');
          time.hour = currentHour;

          #get index of the last iteration, but when it's not -1
          if index > 0
            lastIndex = index - 1;
          #on the first loop, create an array with the first time
          if index == 0
            byDay.push [time]
            byDay[dayNumber].day = currentDate;
          #assign current loop day and last loop day for checking
          if lastIndex
            currentDay = moment(list[index].dt, 'X').format('Do');
            lastDay = moment(list[lastIndex].dt, 'MMMM Do YYYY, h:mm A').format('Do')
          #push time to current day's array if this day is equal to the last day
          if lastIndex && currentDay == lastDay
            byDay[dayNumber].push time
          #create a new arraw if current day doesn't equal the last day
          if lastIndex && currentDay != lastDay
            dayNumber++
            byDay.push [time]
            byDay[dayNumber].day = currentDate;

        #format data to be readable
        time.dt = moment(time.dt, 'X').format('MMMM Do YYYY, h:mm A')
        Farenheight = Math.round(time.main.temp * 9 / 5 - 459.67)
        time.main.temp = Farenheight

      #view model data
      vm.city = response.data.city.name
      vm.list=byDay
      console.log byDay

    return
]
