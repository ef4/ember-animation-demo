`import Ember from 'ember';`
`import slides from "animation-demo/models/slides"`

IndexRoute = Ember.Route.extend
  beforeModel: -> @transitionTo slides[0].get('route')

`export default IndexRoute`
