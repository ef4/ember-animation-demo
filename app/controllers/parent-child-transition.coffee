`import Ember from 'ember';`

C = Ember.ArrayController.extend
  needs: ['application']
  routeName: Em.computed.alias('controllers.application.currentRouteName')

  over: ((k,v)->
    return v if arguments.length > 1
    /\bdetail$/.test(@get('routeName'))
  ).property('routeName')

`export default C`
