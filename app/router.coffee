`import slides from "animation-demo/models/slides"`

Router = Ember.Router.extend()

Router.map ->
  for slide in slides
    @resource(slide.get('route'))


`export default Router`
