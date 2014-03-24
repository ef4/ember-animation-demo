AnimatedIfView = Ember.ContainerView.extend
  classNames: ['animated-if']
  classNameBindings: ['activated']
  init: ->
    @_super()
    @update()

  createChild: (which) ->
    AnimatedIfChild.create
      which: which
      template: @get(which+'Template')
      classNames: which
      heightBinding: "_parentView.#{which}Height"
      siblingHeightBinding: "_parentView.#{if which=='first' then 'second' else 'first'}Height"

  findChild: (which)->
    @find((child) -> child.get('which')==which)

  update: (->
    [toShow, toHide] = if @get('showFirst')
      ['first', 'second']
    else
      ['second', 'first']

    hideMe = @findChild(toHide)
    showMe = @findChild(toShow)

    if hideMe
      hideMe.set('away', true)
      if showMe
        showMe.set('away', false)
      else
        showMe = @createChild(toShow)
        showMe.set('away', true)
        showMe.set('pleaseReturn', true)
        @pushObject(showMe)
    else
      if showMe
        showMe.set('away', false)
      else
        showMe = @createChild(toShow)
        showMe.set('away', false)
        @pushObject(showMe)
  ).observes('showFirst')

  childrenChanged: (->
    if @get('length') < 2 and @_wasTransitioning
      @_wasTransitioning = false
    else if @get('length') > 1 and not @_wasTransitioning
      @_wasTransitioning = true
  ).observes('length')

  # animations are only active if both child elements currently exist.
  activated: (->
    @get('length') == 2
  ).property('length')

  heightAnimator: (->
    targetHeight = if @get('showFirst')
      @get('firstHeight')
    else
      @get('secondHeight')
    targetHeight += (@get('childHeightChange') ? 0)
    @set('childHeightChange', null)
    @$().data('heightChange', targetHeight - @$().height())
    @$().trigger('dynamicSpaceChange')
    @$().height(targetHeight)
  ).observes('firstHeight', 'secondHeight', 'showFirst')

  listenForDynamicChildren: (->
    @$().on 'dynamicSpaceChange', (event) =>
      if (event.target != @get('element')) && (heightChange = $(event.target).data('heightChange'))
        @set('childHeightChange', heightChange)
        @heightAnimator()
        false

  ).on('didInsertElement')

#import MeasuredBox from "appkit/components/measured-box"
AnimatedIfChild = MeasuredBox.extend
  offset: (->
    return 0 unless @get('away')
    if @get('which') == 'first'
      -@get('height')
    else
      @get('siblingHeight')
  ).property('siblingHeight', 'away')

  style: (->
    "-webkit-transform: translate3d(0, #{@get 'offset'}px, 0)"
  ).property('offset')

  attributeBindings: ['style']

  didInsertElement: ->
    @_super()
    if @get('pleaseReturn')
      @set('pleaseReturn', false)
      Ember.run.next =>
        @set('away', false)
    @$().bind 'webkitTransitionEnd', =>
      Ember.run =>
        @destroy() if @get('away')

Ember.Handlebars.registerHelper 'animated-if', (property, options) ->
  options.hash.firstTemplate = options.fn
  delete options.fn
  options.hash.secondTemplate = options.inverse
  delete options.inverse
  options.hash.showFirstBinding = property
  Ember.Handlebars.helpers.view.call(this, AnimatedIfView, options)
