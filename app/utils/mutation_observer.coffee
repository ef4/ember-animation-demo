MutationObserver = window.MutationObserver or window.WebkitMutationObserver

unless MutationObserver
  class MutationObserver
    constructor: (@callback) ->
    observe: (elt, opts) ->
      @interval = setInterval(@callback, 100)
    disconnect: ->
      clearInterval(@interval)

`export default MutationObserver;`