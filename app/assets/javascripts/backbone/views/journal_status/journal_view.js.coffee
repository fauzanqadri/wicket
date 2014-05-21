Wicket.Views.JournalStatus ||= {}
class Wicket.Views.JournalStatus.JournalView extends Backbone.View
  template: JST["backbone/templates/journal_status/journal"]

  tagName: "tr"

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
