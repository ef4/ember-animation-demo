slides = [
  "Welcome"
  "Animated If"
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