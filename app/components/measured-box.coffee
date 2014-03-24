`import MutationObserver from "animation-demo/utils/mutation_observer"`

MeasuredBox = Ember.Component.extend
  didInsertElement: ->
    # This prevents margin collapse
    @$().css(
      border: '1px solid transparent'
      margin: '-1px'
    )

    @didMutate()
    @observer = new MutationObserver((mutations) => @didMutate(mutations))
    @observer.observe(@get('element'), attributes: true, subtree: true, childList: true)
    @$().bind 'webkitTransitionEnd', => @didMutate()
    # Chrome Memory Leak: https://bugs.webkit.org/show_bug.cgi?id=93661
    window.addEventListener 'unload', => @willDestroyElement()

  willDestroyElement: -> @observer?.disconnect()

  didMutate: ->
    Em.run.next => @_didMutate()

  _didMutate: ->
    elt = @$()
    return unless elt?[0]

    # if jQuery sees a zero dimension, it will temporarily modify the
    # element's css to try to make its size measurable. But that's bad
    # for us here, because we'll get an infinite recursion of mutation
    # events. So we trap the zero case without hitting jQuery.

    if elt[0].offsetWidth == 0
      @set('width', 0)
    else
      @set('width', elt.width())
    if elt[0].offsetHeight == 0
      @set('height', 0)
    else
      @set('height', elt.height())

`export default MeasuredBox`
