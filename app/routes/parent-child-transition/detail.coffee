`import Ember from 'ember';`
`import SampleItem from "animation-demo/models/sample_item"`

R = Ember.Route.extend
  model: (params) ->
    SampleItem.find(params.id)

  actions:
    back: -> @transitionTo 'parent-child-transition'

    willTransition: (transition) ->
      me = @routeName

      # if the destination still involves us, we don't need to do
      # anything. This covers the case where we're moving between our
      # own child routes, for example.
      if transition.params['parent-child-transition.detail']
        return true

      # clear the flag that slid us over
      @controllerFor('parent-child-transition').set('over', false)

      # if the destination is beyond even our parent, we don't need to
      # wait for the animation to run.
      unless transition.params['parent-child-transition']
        return true

      # otherwise, we need to wait for the animation to run before we
      # let our view get destroyed.
      if ((container = $(".parent-child-slider")).length > 0) and container.is('.over')
        transition.abort()
        container.one 'webkitTransitionEnd', ->
          Ember.run -> transition.retry()
      true

`export default R`
