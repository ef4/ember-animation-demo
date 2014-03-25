Ember.TextSupport.reopen
  didInsertElement: ->
    @_super()
    if ms = @get('delayedAutoFocus')
      Ember.run.later(this, (-> @$().focus()), ms)