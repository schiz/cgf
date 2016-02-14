Admin.FlipView = Ember.Mixin.create(
  actions:
    toggleEditingMode: ->
      flip = @$().find('.flip')
      
      flip.removeClass("pt-page-rotateFoldTop")
      flip.removeClass("pt-page-moveFromBottomFade")
      controller = @controller
      
      flip.addClass("pt-page-rotateFoldTop").delay(700).queue ->
        controller.send("toggleEditingMode")
        $(this).removeClass("pt-page-rotateFoldTop").addClass("pt-page-moveFromBottomFade").dequeue()

)