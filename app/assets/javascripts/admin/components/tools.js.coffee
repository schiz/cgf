Admin.CnImgHolderComponent = Ember.Component.extend(
  attributeBindings: ['dataSrc:data-src', 'class', 'type', 'color:color', 'width', 'height', 'title', 'parentid']
  classNameBindings: ['isCss:holderjs']
  color: "#DDD"
  isCss: false
  type: 'img'
  contentChanged: (->
    @setDataSrc()
    Em.run.later this, (->
      
      @runHolder()
    ), 1000
    
  ).observes('width', 'height', 'color', 'title')
  
  init: ->
    @_super()
    @set('tagName', @type)
    
    @set('isCss', true) unless @type is 'img'
    @setDataSrc()
  
    
  didInsertElement: ->
    @runHolder()
  
  runHolder: ->
    unless @get('type') is "img"
      @$().css("background" : "url('?#{@get('dataSrc')}') no-repeat")
      @$().css("width" : "#{@get('width')}px")
      @$().css("height" : "#{@get('height')}px")
    
    Holder.add_theme(@get('parentid'), { background: @get('color'), text: @get('title'), foreground: '#fff', size: 12 })
    Holder.run
      domain: "images.com"

  setDataSrc: ->
    @set('dataSrc', "images.com/#{@get('width')}x#{@get('height')}/#{@get('parentid')}")

)

Admin.CnColorMultiselectComponent = Ember.Component.extend(Admin.Multiselect,
  label: "TEST"
)


Admin.CnSearchListComponent = Ember.Component.extend(
  attributeBindings: ['style', 'maxheight:maxheight', 'external:external', 'filter:filter']
  maxheight: "200px"
  isOpen: false
  external: false
  filter: 'title'
  
  actions:
    toggleList: ->
      @set('isOpen', !@get('isOpen'))
  
  didInsertElement: ->
    @$().css("max-height", @get("maxheight"))
    @$().css("overflow", "auto")
  
  searchedContent: (->
    filter = @get('filter')
    regexp = new RegExp(@get("search"), "i")
    @get("list").filter (item) ->
      regexp.test item.get(filter)
  ).property("search", 'list.@each')
  
)

Admin.CnColorPickerComponent = Ember.TextField.extend(
  
  didInsertElement: ->
    @$().colorPicker(
      format: 'hex'
      size: 125
    )
    @$().colorPicker('setColor', @value ? '#7d7d7d')
)

Admin.CnFontHolderComponent = Ember.Component.extend(
  tagName: 'span'
  attributeBindings: ['fontfile', 'fontsize']
  
  didInsertElement: ->
    font = new Font()
    
    object = @$()
    font.onload = ->
      object.css("font-family", "\'#{font.fontFamily}\'")
      object.css("font-size", "30px")
      object.html()
    font.src = "http://localhost:8000/assets/#{@fontfile}.ttf"
    #font.fontFamily = "A.C.M.E. Secret Agent"
)

Admin.CnBsPanelComponent = Ember.Component.extend(Bootstrap.TypeSupport,
    classNames: ['panel']
    classTypePrefix: ['panel']
    classNameBindings: ['fade', 'fade:in', 'marginable:panel-margin-top', 'nooverflow:nooverflow']
    clicked: null
    onClose: null
    fade: true
    collapsible: false
    open: true
    marginable: false
    nooverflow: true
    accordion: "#accordion"

    actions:
        close: (event) ->
            @sendAction('onClose')
            @$().removeClass('in')
            #TODO: Causes ' Object #<HTMLDivElement> has no method 'destroyElement' '
            #@$().one($.support.transition.end, @destroy).emulateTransitionEnd(150)
            #Workaround
            setTimeout (->
                @destroy()
            ).bind(@), 250

    click: (event) ->
        @sendAction('clicked')

    collapsibleBodyId: (->
        "#{@get('elementId')}_body"
    ).property('collapsible')

    collapsibleBodyLink: (->
        "##{@get('elementId')}_body"
    ).property('collapsibleBodyId')
)