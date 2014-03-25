C = Ember.Controller.extend
  actions:
    launchModal: -> @transitionToRoute(queryParams: {modalDemo: true})

`export default C`