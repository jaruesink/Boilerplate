angular.module('App').directive 'ngFocus', ['$timeout'
  ($timeout) ->
    (scope, element, attrs) ->
      scope.$watch attrs.ngFocus, (value) ->
        if value == true
          console.log 'value=', value
          element.focus()
          scope[attrs.ngFocus] = false
        return
      return
  
]
