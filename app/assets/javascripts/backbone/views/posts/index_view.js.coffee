Wicket.Views.Posts ||= {}

class Wicket.Views.Posts.IndexView extends Backbone.View
  template: JST["backbone/templates/posts/index"]

  initialize: () ->
    @options.posts.bind('reset', @addAll)

  addAll: () =>
    @$("#paginate").empty()
    @$("#posts").empty()
    pagination = new Wicket.Views.Paginations.IndexView(page_info: @options.posts.pageInfo(), action: this)
    @$("#paginate").html(pagination.render().el)
    @options.posts.each(@addOne)

  next: =>
    @options.posts.nextPage()

  prev: =>
    @options.posts.prevPage()

  addOne: (post) =>
    view = new Wicket.Views.Posts.PostView({model : post})
    @$("#posts").append(view.render().el)

  render: =>
    $(@el).html(@template())
    return this
