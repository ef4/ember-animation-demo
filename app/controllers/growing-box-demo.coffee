C = Ember.Controller.extend
  contacts: null
  init: -> @set('contacts', [Ember.Object.create()])

  actions:
    addContact: -> @get('contacts').pushObject(Ember.Object.create())
    deleteContact: (which) -> @get('contacts').removeObject(which)

`export default C`