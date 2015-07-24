angular.module('App').filter 'KtoF', ->
  (input) ->
    K = Math.round(input * 9 / 5 - 459.67)
    K
