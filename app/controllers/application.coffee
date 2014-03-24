C = Ember.ArrayController.extend
  jumpSlides: (n) ->
    slides = @get('model')
    currentRoute = @get('currentRouteName').split('.')[0]
    currentIndex = slides.indexOf(slides.find (s) -> s.get('route') == currentRoute)
    nextSlide = slides[currentIndex + n]
    if nextSlide
      @transitionToRoute nextSlide.get('route')

  actions:
    nextSlide: -> @jumpSlides(1)
    previousSlide: -> @jumpSlides(-1)

`export default C`