$ ->
  $("input.ui-date-picker").each (i) ->
    $(this).datepicker
      altFormat: "yy-mm-dd"
      dateFormat: "mm/dd/yy"
      altField: $(this).next()

$ ->
  $("input.ui-datetime-picker").each (i) ->
    $(this).datetimepicker
      altFormat: "yy-mm-dd"
      dateFormat: "mm/dd/yy"
      altField: $(this).next()
      altFieldTimeOnly: false
      altTimeFormat: "HH:mm:'00'"
      dateFormat: 'mm/dd/yy'
      timeFormat: 'hh:mm tt'

