`import Ember from 'ember';`

slides = [
  "Title Slide"
  "Not This Kind"
  "Physical Metaphors"
  "Momentum Example"
  "Simple Animated Bind"
  "Animated Bind Source"
  "Measured Box Demo"
  "Measured Box Source"
  "Growing Box Demo"
  "Growing Box Source"
  "Animated If Demo"
  "Animated If Source"
  {title: "Route Transition", autoRoute: false}
  "Route Transition Source"
  {title: "Context Dependent Route Transition", autoRoute: false}
  "Context Dependent Source"
  {title: "Modal Demo", route: "modal-launcher"}
]

Slide = Ember.Object.extend
  route: ((k,v) ->
    return v if arguments.length > 1
    @get('title').dasherize()
  ).property('title')

slideObjects = slides.map (s) ->
  if typeof(s) == 'string'
    Slide.create(title: s)
  else
    Slide.create(s)

`export default slideObjects`
