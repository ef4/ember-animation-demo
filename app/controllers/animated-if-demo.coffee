C = Ember.Controller.extend
  showingDetail: false
  actions:
    toggleDetail: -> @set('showingDetail', not @get('showingDetail'))

`export default C`