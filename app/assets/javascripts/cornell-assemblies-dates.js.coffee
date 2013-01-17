$ ->
  $("input.ui-date-picker").each (i) ->
    $(this).datepicker
      altFormat: "yyyy-mm-dd"
      dateFormat: "mm/dd/yyyy"
      altField: $(this).next()

$ ->
  $("input.ui-datetime-picker").each (i) ->
    $(this).datetimepicker
      altFormat: "yyyy-mm-dd"
      dateFormat: "mm/dd/yyyy"
      altField: $(this).next()
      altFieldTimeOnly: false
      altTimeFormat: "HH:mm:'00'"
      dateFormat: 'mm/dd/yyyy'
      timeFormat: 'hh:mm tt'

