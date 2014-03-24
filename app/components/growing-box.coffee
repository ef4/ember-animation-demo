GrowingBox = Ember.Component.extend
  transition: 'height 250ms ease-out'
  animateAtInsertion: false

  layoutName: 'growing-box-layout'

  didInsertElement: ->
    @_super()
    if @get('animateAtInsertion')
      @enableTransition()
    @$().css(overflow: 'hidden')

    # if there are other growing views in our descendants, and they
    # animate, we won't see their resulting size changes until their
    # animations finish. This causes our animation to run in series
    # after theirs.
    #
    # Instead, we propagate our own event up the DOM to give early
    # warning, allowing the animations to run in parallel, which gives
    # a much nicer visual effect.
    @$().on 'dynamicSpaceChange', (event) =>
      if (event.target != @get('element')) && (heightChange = $(event.target).data('heightChange'))
        @set('childHeightChange', heightChange)
        @heightChanged()
        false

  enableTransition: ->
    @$().css('webkitTransition', @get('transition'))
    @set('enabledTransition', true)

  heightChanged: (->
    currentHeight = @$().height()
    targetHeight = @get('contentHeight') + (@get('childHeightChange') ? 0)
    @set('childHeightChange', null)
    @$().css('height', targetHeight)
    @$().data('heightChange', targetHeight - currentHeight)
    @$().trigger('dynamicSpaceChange')
    unless @get('enabledTransition')
      Ember.run.next => @enableTransition()
  ).observes('contentHeight')
  classNames: ['pretty-color']
  attributeBindings: ['style']
  style: (->
    'color: ' + this.get('name') + ';'
  ).property('name')

`export default GrowingBox`
