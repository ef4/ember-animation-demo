`import Ember from 'ember';`
`import SampleItem from "animation-demo/models/sample_item"`

R = Ember.Route.extend
  model: (params) ->
    SampleItem.find(params.id)

  actions:
    back: -> @transitionTo 'parent-child-transition'

    willLeave: (transition, alsoLeaving) ->
      # clear the flag that slid us over
      @controllerFor('parent-child-transition').set('over', false)

      unless alsoLeaving('parent-child-transition')
        if ((container = $(".parent-child-slider")).length > 0) and container.is('.over')
          transition.abort()
          container.one 'webkitTransitionEnd', ->
            Ember.run -> transition.retry()
      true

`export default R`
