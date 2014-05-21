class Wicket.Routers.JournalStatusRouter extends Backbone.Router
  initialize: (options) ->
    @journal_status = new Wicket.Collections.JournalStatusCollection()

  routes:
    'index' : 'index'
    '.*' :  'index'

  index: ->
    @view = new Wicket.Views.JournalStatus.IndexView(journal_status: @journal_status)
    $("#journal-status").html(@view.render().el)
    @journal_status.startLongPolling(1)
