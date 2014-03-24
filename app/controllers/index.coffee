IndexController = Ember.ArrayController.extend
  counter: 0

  actions:
    add: ->
      @pushObject(@counter++)

`export default IndexController;`