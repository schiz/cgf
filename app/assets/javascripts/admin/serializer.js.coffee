DS.JSONSerializer.reopen serializeHasMany: (record, json, relationship) ->
  key = relationship.key
  relationshipType = DS.RelationshipChange.determineRelationshipType(record.constructor, relationship)
  json[key] = Ember.get(record, key).mapBy("id")  if relationshipType is "manyToNone" or relationshipType is "manyToMany" or relationshipType is "manyToOne"
