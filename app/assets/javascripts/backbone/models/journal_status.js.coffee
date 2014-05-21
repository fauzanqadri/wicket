class Wicket.Models.JournalStatus extends Backbone.Model
  paramsRoot: 'journal_status'

class Wicket.Collections.JournalStatusCollection extends Backbone.Collection
  model: Wicket.Models.JournalStatus
  url: ->
    $("#journal-status").data("source")

  longPolling: false

  intervalMinutes: 2

  startLongPolling: (intervalMinutes) =>
    @longPolling = true
    if intervalMinutes
      @intervalMinutes = intervalMinutes
    @executeLongPolling()

  stopLongPolling: () =>
    @longPolling = false

  executeLongPolling: () =>
    @fetch({success: @onFetch})

  onFetch: () =>
    if @longPolling
      setTimeout(@executeLongPolling, 1000 * 60 * @intervalMinutes);
