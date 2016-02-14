Cgf.ApplicationController = Ember.ObjectController.extend(
  
  
  menuPreview: false
  testPath: false
  renderPage: "shared/main"
  pages: ["main","timeline", "mainpage", "project_video", "view_all_project", "play_list", "blog_entry", "contacts", "main-ru", "timeline-ru", "video-ru-wrap", "blog_entry-new_style"]
  
  actions:
    setMenu: ->
      @set('menuPreview', !@get("menuPreview"))
      
    switchPage: (page) ->
      @set('renderPage', "shared/#{page}")
    
    test: ->
      @set('testPath', true)
    
      
)