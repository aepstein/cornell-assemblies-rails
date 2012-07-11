//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require jquery-ui-timepicker-addon
//= require cocoon

$(document).ready(function(){
  $('input.ui-date-picker').datepicker({ dateFormat: 'yy-mm-dd' });
  $('input.ui-datetime-picker').datetimepicker({ ampm: true,
    dateFormat: 'yy-mm-dd', timeFormat: 'hh:mm tt'  });
});

