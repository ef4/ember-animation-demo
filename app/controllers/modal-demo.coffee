`import Ember from 'ember';`

C = Ember.ObjectController.extend
  actions:
    dismiss: -> @transitionToRoute(queryParams: {modalDemo: false})

`export default C`
