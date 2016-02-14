Admin.DraggableColorView = Ember.View.extend(DragNDrop.Draggable,
  tagName: 'div'
  dragStart: (event)->
    @._super(event)
    dataTransfer = event.originalEvent.dataTransfer
    dataTransfer.setData "contentId", @content.get('id')
)

Admin.DroppableColorView = Ember.View.extend(DragNDrop.Droppable,
  tagName: 'div'
  defaultBorder: ''
  
  didInsertElement: ->
    @set('defaultBorder', @$().parents(".panel").css("border-color"))
      
  drop: (event) ->
    event.preventDefault()
    color_id = event.originalEvent.dataTransfer.getData('contentId')
    @gragStyleStop()
    @content.send("createSizeColor", color_id)
    false
  
  dragOver: (event) ->
    event.preventDefault()
    
    #bgcolor = event.target.originalEvent.dataTransfer.getData('Text')
    #console.log event.dataTransfer.getData('SText')
    @gragStyleStart()
    false
  dragLeave: ->
    event.preventDefault()
    @gragStyleStop()
    false
  
  gragStyleStart: ->
    @$().find(".droppable-panel").addClass("dnd-border")
    
  gragStyleStop: ->
    @$().find(".droppable-panel").removeClass("dnd-border")
)