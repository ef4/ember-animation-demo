C = Ember.ObjectController.extend
  actions:
    increment: ->
      @transitionToRoute(
        'context-dependent-route-transition.detail',
        @get('model.id') + 1
      )
    decrement: ->
      @transitionToRoute(
        'context-dependent-route-transition.detail',
        @get('model.id') - 1
      )

`export default C`