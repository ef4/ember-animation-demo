SampleItem = Ember.Object.extend()

items = [
  {id: 0, name: 'Alpha'}
  {id: 1, name: 'Bravo'}
]

SampleItem.reopenClass
  findAll: -> items.map (i) -> SampleItem.create(i)
  find: (id) ->
    console.log("trying to find #{id}")
    @findAll().find (item) -> String(item.get('id')) == String(id)

`export default SampleItem`