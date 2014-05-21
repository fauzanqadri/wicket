$(document).ready ->
  window.router = new Wicket.Routers.JournalStatusRouter()
  try
    Backbone.history.start()
  catch e
    Backbone.history.stop()
    Backbone.history.start()
