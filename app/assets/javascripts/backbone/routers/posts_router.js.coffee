class Wicket.Routers.PostsRouter extends Backbone.Router
  initialize: (options) ->
    @posts = new Wicket.Collections.PostsCollection()

  routes:
    "index"    : "index"
    ".*"        : "index"

  index: ->
    @view = new Wicket.Views.Posts.IndexView(posts: @posts)
    $("#home").html(@view.render().el)
    @posts.fetch
      reset: true
