class Wicket.Models.Post extends Backbone.Model
  paramRoot: 'post'

class Wicket.Collections.PostsCollection extends Backbone.Collection
  model: Wicket.Models.Post
  url: '/posts'

  initialize: ()->
    @total_records = 0
    @display_length = 10
    @display_start = 0
    @echo = 1
    @total_display_records = 0


  parse: (data) =>
    @total_records = data.total_records
    @total_display_records = data.total_display_records
    @page = data.page
    return data.posts

  fetch: (options) =>
    options or (options = {})
    data = (options.data or {})
    params = 
      reset: true
      data: $.param
        display_length: @display_length
        display_start: @display_start
    _.extend(options, params)
    Backbone.Collection::fetch.call this, options

  pageInfo: () =>
    data =
      total_records: @total_records
      display_length: @display_length
      display_start: @display_start
      page: @page
      total_display_records: @total_display_records
      pages: Math.ceil(@total_records/@display_length)
      next: false
      prev: false
    max = Math.min(@total_records, @page * @display_length)
    max = @total_records if @total_records is @page * @display_length
    data.range = [(@page - 1) * @display_length + 1, max]
    data.prev = @page - 1 if @page > 1
    data.next = @page + 1 if @page < data.pages
    return data

  nextPage: () ->
    return false unless @pageInfo().next
    @display_start = parseInt(@display_start) + parseInt(@display_length)
    return @fetch()

  prevPage: () ->
    return false unless @pageInfo().prev
    @display_start = parseInt(@display_start) - parseInt(@display_length)
    return @fetch()
