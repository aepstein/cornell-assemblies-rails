#= require jquery
#= require jquery_ujs
#= require jquery.ui.all
# require jquery.purr
# require best_in_place
#= require bootstrap-sprockets
#= require moment
#= require bootstrap-datetimepicker
#= require cocoon
#= require fullcalendar
#= require bootstrap-colorpicker

$ ->
  $.cornellUI =
    updateParent: ( item ) ->
      list = $(item).parent().closest("fieldset")
      $.cornellUI.updateList(list) if list.data("ordered-by")
    updateList: (list) ->
      field = $(list).data('ordered-by')
      fieldSelector = "[name$='[" + field + "]']"
      $(list).find("> .nested-fields > .form-group " + fieldSelector).each (index, element) ->
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
    applyAutocomplete: (scope) ->
      $(scope).find("input.autocomplete").each (i) ->
        sourceURL = $(this).data("url")
        dynamicTerm = $(this).data("dynamic-term")
        dynamicID = $(this).data("dynamic-id")
        field = $(this)
        $(this).autocomplete(
          source: ( (request, response) ->
            options = { term: request.term.split().pop().replace(/^\s+/,"") }
            if dynamicTerm and dynamicID
              dElement = "#" + dynamicID
              options[dynamicTerm] = ( $("select" + dElement + 
                " option:selected").attr("value") or $(dElement).attr("value") )
            $.getJSON( sourceURL, options, response ) ),
          minLength: 2,
          select: ( ( event, ui ) ->
            target = field.siblings("input.autocomplete-target")
            if target
              $(target).val( ui.item.value )
              $(field).val( ui.item.label )
            else
              $(field).val( ui.item.value )
            false ) )
    applyBehaviors: (scope) ->
      $(scope).find("[data-behavior~='date-picker']").each (i) ->
        $(this).datetimepicker
          format: "YYYY-MM-DD"
          pickTime: false
      $(scope).find("[data-behavior~='datetime-picker']").each (i) ->
        $(this).datetimepicker
          format: "YYYY-MM-DD hh:mm AA"
          pick12HourFormat: true
          pickSeconds: false
#      $(scope).find(".best_in_place").best_in_place()
      $(scope).find("input.colorpicker").colorpicker()
      $.cornellUI.applyAutocomplete( $(scope) )
      $.cornellUI.setupList( $(scope).find("fieldset.cocoon") )
      $.cornellUI.setupOrderedList( $(scope).find("fieldset[data-ordered-by]") )
  $.cornellUI.applyBehaviors( $("body") )

