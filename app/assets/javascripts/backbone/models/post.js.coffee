class Wicket.Models.Post extends Backbone.Model
  paramRoot: 'post'

  defaults:
    title: null
    content: null

class Wicket.Collections.PostsCollection extends Backbone.Collection
  model: Wicket.Models.Post
  url: '/posts'
