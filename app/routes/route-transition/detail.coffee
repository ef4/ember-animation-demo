`import Ember from 'ember';`
`import SampleItem from "animation-demo/models/sample_item"`

R = Ember.Route.extend
  model: (params) ->
    SampleItem.find(params.id)

  actions:
    back: -> @transitionTo 'route-transition'


`export default R`
