Wicket.Views.Posts ||= {}

class Wicket.Views.Posts.PostView extends Backbone.View
  template: JST["backbone/templates/posts/post"]

  className: "post"

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
