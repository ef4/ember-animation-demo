R = Ember.Route.extend
  beforeModel: ->
    this.transitionTo 'context-dependent-route-transition.detail', 1

`export default R`