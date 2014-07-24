`import slides from "animation-demo/models/slides"`

Router = Ember.Router.extend()

Router.map ->
  # setup all the default simple slide routes
  for slide in slides
    unless slide.get('autoRoute') == false
      @resource(slide.get('route'))

  # any slides with more complicated needs have autoRoute==false, and
  # we set them up manually here:
  @resource 'route-transition', ->
    @route 'detail', {path: '/:id'}

  @resource 'context-dependent-route-transition', ->
    @route 'detail', {path: '/:id'}

`export default Router`
