`import SampleItem from "animation-demo/models/sample_item"`

R = Ember.Route.extend
  model: -> SampleItem.findAll()

`export default R`