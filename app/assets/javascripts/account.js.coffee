# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#accounts").dataTable
    sPaginationType: "full_numbers"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#accounts').data('source')
    sPaginationType: "bootstrap"
    aoColumnDefs: [
      bSortable: false,
      aTargets: [4]
    ]
