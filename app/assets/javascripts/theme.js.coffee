jQuery ($) ->

  $('[data-behaviour~=datepicker]').datepicker({
    format: "yyyy-mm-dd",
    todayBtn: "linked",
    language: language,
    orientation: "top auto",
    todayHighlight: true
  })

