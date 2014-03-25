slides = [
  "Title Slide"
  "Not This Kind"
  "Physical Metaphors"
  "Momentum Example"
  "Slide Example"
  "Ember Specifics"
  "Simple Animations"
  "Resuable Components"
  "Simple Animated Bind"
  "Measured Box Demo"
  "Growing Box Demo"
  "Animated If Demo"
]

Slide = Ember.Object.extend
  route: ((k,v) ->
    return if arguments.length > 1
    @get('title').dasherize()
  ).property('title')

slideObjects = slides.map (s) ->
  if typeof(s) == 'string'
    Slide.create(title: s)
  else
    Slide.create(s)

`export default slideObjects`