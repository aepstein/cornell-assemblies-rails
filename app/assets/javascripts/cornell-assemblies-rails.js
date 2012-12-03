//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.purr
//= require best_in_place
//= require autocomplete-rails
//= require jquery-ui-timepicker-addon
//= require cocoon

$(document).ready(function(){
  $('input.ui-date-picker').datepicker({ dateFormat: 'yy-mm-dd' });
  $('input.ui-datetime-picker').datetimepicker({ ampm: true,
    dateFormat: 'yy-mm-dd', timeFormat: 'hh:mm tt'  });
});

$(document).ready(function() {
  jQuery(".best_in_place").best_in_place();
});

// Sortable cocoon (see https://github.com/nathanvda/cocoon/pull/104)
(function($) {
  $.fn.parentSiblings = function(selector) {
    return $(this).parent().siblings(selector);
  }
  $.cocoon = {
    ordered: {
      options: {
        items: '> .nested-fields',
        stop: function(e, ui) {
          if (window.CKEDITOR) {
            var editors = $(ui.item).data('cocoon_ckeditors');
            var i, j;

            for (i = 0, j = editors.length; i < j; ++i) {
              var id = editors[i];
              var editor = CKEDITOR.instances[id];

              if (editor) {
                editor.destroy(true);
                CKEDITOR.remove(id);
              }

              CKEDITOR.replace(id);
            }

            $(ui.item).data('cocoon_ckeditors', []);
          }

          $.cocoon.ordered._updateFields(this)
        },
        start: function(e, ui) {
          if (window.CKEDITOR) {
            var editors = [];

            $(ui.item).find('textarea').each(function(index, element) {
              var id = $(element).attr('id');
              var editor = CKEDITOR.instances[id];
              if (editor) {
                editors.push(id);

                editor.destroy();
                CKEDITOR.remove(id);
              }
            });

            $(ui.item).data('cocoon_ckeditors', editors);
          }
        }
      },
      _updateFields: function(element) {
        console.log(element)
        console.log($(element).data('fieldSearch'))
        console.log($(element).find($(element).data('fieldSearch')))

        $(element).find($(element).data('fieldSearch')).each(function(index, element) {
          $(element).val(index);
        });
      },
      setup: function() {
        $('li[data-ordered_by]').each(function(index, element) {
          var field = $(element).data('ordered_by');
          var fieldSelector = "[name*='[" + field + "]']"
          var fieldGroupSelector = "> .forms > .nested-fields"
          var orderFieldSelector = "> .nested-fields " + fieldSelector;
          var fieldSearch = "> .forms " + orderFieldSelector;

          $(element).find('.forms').data('fieldSearch', orderFieldSelector).sortable($.cocoon.ordered.options);

          $(element).unbind('cocoon:after-insert').bind('cocoon:after-insert', function(e, node) {
            var nextOrder = 0;

            if ($(element).find(fieldGroupSelector).is(node)) {
              $(element).find(fieldSearch).each(function() {
                nextOrder = Math.max(nextOrder, Number($(this).val()));
              });

              $(node).find(fieldSelector).val(nextOrder + 1)
            }
          });
        });

        $(document).on('cocoon:after-insert', function() { $.cocoon.ordered.setup(); });
      }
    },
  };

  $(function() { $.cocoon.ordered.setup(); });
})(jQuery);

