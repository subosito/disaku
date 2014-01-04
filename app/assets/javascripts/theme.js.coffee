jQuery ($) ->

  $('[data-behaviour~=datepicker]').datepicker({
    format: "dd-mm-yyyy",
    todayBtn: "linked",
    language: "en",
    orientation: "top auto",
    todayHighlight: true
  })

