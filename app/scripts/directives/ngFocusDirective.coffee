angular.module('App').directive 'ngFocus', ['$timeout'
  ($timeout) ->
    (scope, element, attrs) ->
      scope.$watch attrs.ngFocus, (value) ->
        $timeout (->
          if value == true
            element.focus()
            scope[attrs.ngFocus] = false
          return), 10
      return
]
