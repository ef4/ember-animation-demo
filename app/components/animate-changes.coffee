AnimateChanges = Ember.Component.extend
  tagName: 'div'
  classNameBindings: ['animating', ':change-animator']

  didInsertElement: ->
    @animationEnabled = true

  of: ((k,v)->
    if arguments.length > 1
      if @animationEnabled
        @set('nextValue', v)
        @triggerAnimation()
      else
        @set('currentValue', v)
      v
    null
  ).property()

  triggerAnimation: ->
    @set('animating', true)
    @$().one 'webkitAnimationEnd', =>
      @set('currentValue', @get('nextValue'))
      @set('animating', false)

`export default AnimateChanges`