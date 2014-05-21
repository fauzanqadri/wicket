Wicket.Views.JournalStatus ||= {}

class Wicket.Views.JournalStatus.IndexView extends Backbone.View
  template: JST["backbone/templates/journal_status/index"]

  initialize: ()->
    @options.journal_status.bind('reset', @addAll)

  addAll: () =>
    $("#status-list").empty()
    @options.journal_status.each(@addOne)

  addOne: (journal) =>
    view = new Wicket.Views.JournalStatus.JournalView({model: journal})
    $("#status-list").append(view.render().el)

  render: =>
    $(@el).html(@template)
    return this
