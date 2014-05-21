# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org

$(document).ready ->
  $("#journals").dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#journals').data('source')
    sPaginationType: "bootstrap"
    aoColumnDefs: [
      bSortable: false,
      aTargets: [3, 4]
    ]
