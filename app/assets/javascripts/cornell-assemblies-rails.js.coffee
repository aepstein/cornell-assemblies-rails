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
  $.cornellUI =
    updateParent: ( item ) ->
      list = $(item).parent().closest("fieldset")
      $.cornellUI.updateList(list) if list.data("ordered-by")
    updateList: (list) ->
      field = $(list).data('ordered-by')
      fieldSelector = "[name$='[" + field + "]']"
      $(list).find("> .nested-fields > .control-group " + fieldSelector).each (index, element) ->
        $(element).val( index + 1 )
    setupList: (list) ->
      $(list).unbind('cocoon:after-insert').bind( 'cocoon:after-insert', ( ( event, item ) ->
        $.cornellUI.setupList($(item).parent())
        $.cornellUI.setupList($(item).children().find("fieldset.cornellUI"))
        $.cornellUI.applyBehaviors( item ) ) )
    setupOrderedList: (list) ->
      $(list).sortable(
        items: $(list).find("> .nested-fields")
        stop: -> $.cornellUI.updateList( list ) )
      $(list).bind( 'cocoon:after-insert', ( ( event, item ) ->
        $.cornellUI.setupOrderedList($(item).parent())
        $.cornellUI.setupOrderedList($(item).children().find("fieldset[data-ordered-by]"))
        $.cornellUI.updateParent( item ) ) )
      $(list).unbind('cocoon:after-remove').bind( 'cocoon:after-remove', ( ( event, item ) ->
        $.cornellUI.updateParent( item ) ) )
    applyBehaviors: (scope) ->
      console.log( scope )
      $(scope).find("input.ui-date-picker").each (i) ->
        $(this).datepicker
          altFormat: "yy-mm-dd"
          dateFormat: "mm/dd/yy"
          altField: $(this).next()
      $(scope).find("input.ui-datetime-picker").each (i) ->
        $(this).datetimepicker
          altFormat: "yy-mm-dd"
          dateFormat: "mm/dd/yy"
          altField: $(this).next()
          altFieldTimeOnly: false
          altTimeFormat: "HH:mm:'00'"
          dateFormat: 'mm/dd/yy'
          timeFormat: "hh:mm:'00' tt"
      $(scope).find(".best_in_place").best_in_place()
      $(scope).find("input.colorpicker").colorpicker()
      $(scope).find(".autocomplete").each (i) ->
        sourceURL = $(this).data("url")
        dynamicTerm = $(this).data("dynamic_term")
        dynamicID = $(this).data("dynamic_id")
        $(this).autocomplete(
          source: ( (request, response) ->
            options = { term: request.term.split().pop().replace(/^\s+/,"") }
            if dynamicTerm and dynamicID
              dElement = "#" + dynamicID
              options[dynamicTerm] = ( $(dElement).attr("value") or $(dElement).find("option[selected]").attr("value") )
            $.getJSON( sourceURL, options, response ) ),
          minLength: 2 )
      $.cornellUI.setupList( $(scope).find("fieldset.cocoon") )
      $.cornellUI.setupOrderedList( $(scope).find("fieldset[data-ordered-by]") )
  $.cornellUI.applyBehaviors( $("body") )

