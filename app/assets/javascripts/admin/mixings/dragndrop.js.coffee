DragNDrop = window.DragNDrop = Ember.Namespace.create()

DragNDrop.cancel = (event) ->
  event.preventDefault()
  false

DragNDrop.Draggable = Ember.Mixin.create(
  attributeBindings: "draggable"
  draggable: "true"
  dragStart: (event) ->
    dataTransfer = event.originalEvent.dataTransfer
    dataTransfer.setData "Text", @get("elementId")
    return
)

DragNDrop.Droppable = Ember.Mixin.create(
  dragEnter: DragNDrop.cancel
  dragOver: DragNDrop.cancel
  drop: (event) ->
    event.preventDefault()
    false
)