Admin.Router.map ->
  @resource 'invitations', ->
    @route 'new'
    @route 'edit', {path: ':invitation_id/edit'}
    @route 'color', {path: ':invitation_id/edit_color'}
  @resource 'colors'
  @resource 'fields'
  @resource 'fonts'
    


Admin.IndexRoute = Ember.Route.extend
  model: ->
    return ["a", "b", "c"]



Admin.InvitationsIndexRoute = Ember.Route.extend
  model: ->
    @store.find('invitation')

Admin.InvitationsEditRoute = Ember.Route.extend
  renderTemplate: ->
    @render "invitations.edit"
    
    @render "invitations.form",
      into: "invitations.edit"
      outlet: "editarea"
  
  setupController: (controller, model) ->
    #@controllerFor('invitations.form').set('model', @store.find('color'))
    @controllerFor('invitations.edit').set('model', model)
    @controllerFor('invitations.edit').set('color_icon', 'adjust')
  actions:
    switchColor: (model)->
      @controller.transitionToRouteAnimated('invitations.color', {invitationedit: 'flip'}, model)
      
      

Admin.InvitationsColorRoute = Ember.Route.extend
  renderTemplate: ->
    @render "invitations.edit"
    
    @render "colors.list",
      into: "invitations.edit"
      outlet: "editarea"
      controller: "colors.list"
  
  setupController: (controller, model) ->
    @controllerFor('colors.list').set('model', @store.find('color'))
    @controllerFor('invitations.edit').set('model', model)
    @controllerFor('invitations.edit').set('color_icon', 'record')
  
  actions:
    switchColor: (model)->
      @controller.transitionToRouteAnimated('invitations.edit', {invitationedit: 'flip'}, model)

Admin.InvitationsNewRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.transitionToRouteAnimated('invitations.edit', {invitationindex: 'slideUp'}, @store.createRecord('invitation', {title: "New Invitation", image: "/assets/example-thumbnail.png"}))
    
Admin.ColorsRoute = Ember.Route.extend
  model: ->
    @store.find('color')

Admin.FieldsRoute = Ember.Route.extend
  model: ->
    @store.find('field')

Admin.FontsRoute = Ember.Route.extend
  model: ->
    @store.find('font')

 
  
