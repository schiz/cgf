Cgf.ApplicationView = Ember.View.extend(
  classNames: ["application"]
)
Cgf.VideoView = Ember.View.extend(
  contentTag: "video"
  autoplay: true
  loop: true
  classNames: ["fullscreen"]
  attributesBinding: ["autoplay:autoplay", "loop:loop"]
)