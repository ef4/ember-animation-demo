SampleItem = Ember.Object.extend()

items = [
  {id: 0, name: 'Alpha'}
  {id: 1, name: 'Bravo'}
]

SampleItem.reopenClass
  findAll: -> items.map (i) -> SampleItem.create(i)
  find: (id) -> @findAll().find (item) -> item.get('id') == id

`export default SampleItem`