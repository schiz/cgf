Ember.Handlebars.helper "gicon", (icon, text, options) ->
  #escaped = Handlebars.Utils.escapeExpression(text)
  label = if text.length > 0 then "<span class='icon-label'>#{text}</span>" else ""
  new Handlebars.SafeString("<span class='glyphicon glyphicon-#{icon}'></span>#{label}")
