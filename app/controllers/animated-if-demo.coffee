`import Ember from 'ember';`

C = Ember.Controller.extend
  vehicle: 'Bicycle'
  vehicleChoices: ['Bicycle', 'Car']
  state: null
  states: ['Alabama', 'Alaska', 'Arizona', 'Wyoming']

  requiresLicense: Em.computed.equal('vehicle', 'Car')


`export default C`
