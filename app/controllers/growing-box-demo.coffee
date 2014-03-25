`import "animation-demo/utils/text_extensions"`

C = Ember.Controller.extend
  contacts: null
  init: -> @set('contacts', [Ember.Object.create()])

  actions:
    addContact: -> @get('contacts').pushObject(Ember.Object.create(focusIn: 250))
    deleteContact: (which) -> @get('contacts').removeObject(which)

`export default C`