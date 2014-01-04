jQuery ($) ->

  $('[data-behaviour~=datepicker]').datepicker({
    format: "yyyy-mm-dd",
    todayBtn: "linked",
    language: "en",
    orientation: "top auto",
    todayHighlight: true
  })

