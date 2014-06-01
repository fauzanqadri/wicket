Wicket.Views.Paginations ||= {}
class Wicket.Views.Paginations.IndexView extends Backbone.View
  template: JST["backbone/templates/paginations/index"]
  tagName: "ul"
  className: "pager"

  events:
    'click #next' : 'nextEvent'
    'click #prev' : 'prevEvent'

  initialize: () ->
    @page_info = @options.page_info
    @action = @options.action

  nextEvent: (e)=>
    e.preventDefault()
    @action.next()

  prevEvent: (e)=>
    e.preventDefault()
    @action.prev()

  render: =>
    $(@el).html(@template(@page_info))
    return this
