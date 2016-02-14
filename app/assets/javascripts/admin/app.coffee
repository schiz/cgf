window.Admin = Ember.Application.create()
Admin.ApplicationAdapter = DS.LSAdapter.extend(namespace: "ember-admin")


# TODO support for polymorphic manyToNone and manyToMany
# relationships


Admin.createNested = (patent_item, item_key, item_pluralize, options) ->
  items = patent_item.get(item_pluralize)
  item = patent_item.get('store').createRecord(item_key, options)
  items.pushObject(item)
  
#localStorage.setItem('ember-relations', JSON.stringify(FIXTURES))
#Admin.LSAdapter = DS.LSAdapter.extend(
#  namespace: 'admin-emberjs'
#)

#Admin.Store = DS.Store.extend(
#  adapter: Admin.LSAdapter
#)