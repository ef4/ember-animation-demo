C = Ember.Controller.extend
  now: null
  init: ->
    @interval = setInterval((=> @tick()), 1000)
    @tick()
  willDestroy: -> clearInterval(@interval)

  tick: ->
    now = new Date
    @set('hours', now.getHours())
    @set('minutes', now.getMinutes())
    @set('seconds', now.getSeconds())

`export default C`