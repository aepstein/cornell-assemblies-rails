#= require jquery
#= require jquery_ujs
#= require jquery.ui.all
#= require jquery.purr
#= require best_in_place
#= require jquery-ui-timepicker-addon
#= require bootstrap
#= require cocoon
#= require bootstrap-colorpicker

$ ->
  $("input.ui-date-picker").each (i) ->
    $(this).datepicker
      altFormat: "yy-mm-dd"
      dateFormat: "mm/dd/yy"
      altField: $(this).next()
  $("input.ui-datetime-picker").each (i) ->
    $(this).datetimepicker
      altFormat: "yy-mm-dd"
      dateFormat: "mm/dd/yy"
      altField: $(this).next()
      altFieldTimeOnly: false
      altTimeFormat: "HH:mm:'00'"
      dateFormat: 'mm/dd/yy'
      timeFormat: "hh:mm:'00' tt"
  $(".best_in_place").best_in_place()
  $("input.colorpicker").colorpicker()
  $(".autocomplete").autocomplete(
    source: $(this).data("url"),
    minLength: 2 )

