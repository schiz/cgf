Admin.Multiselect = Ember.Mixin.create(
  tagName: 'select'
  attributeBindings: ['multiple:multiple']
  multiple: 'multiple'
  defaulttext: 'Please Choose'
  label: ''
  
  
  
  didInsertElement: ->
    @$().multiselect(
      buttonContainer: '<div class="btn-group" style="width: 100%" />'
      buttonWidth: '100%'
      buttonClass: 'btn btn-primary'
      enableFiltering: true
      nonSelectedText: @defaulttext
      label: (element)=>
        "#{@label} #{$(element).val()}"
        
    )
)