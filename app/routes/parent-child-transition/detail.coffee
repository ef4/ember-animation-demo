`import SampleItem from "animation-demo/models/sample_item"`

R = Ember.Route.extend
  model: (params) ->
    SampleItem.find(params.id)

`export default R`