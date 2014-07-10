`import Person from "../../models/person"`

R = Ember.Route.extend
  model: (params) -> Person.create(id: parseInt(params.id))

`export default R`