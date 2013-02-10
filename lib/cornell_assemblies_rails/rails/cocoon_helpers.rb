module CornellAssembliesRails
  module Rails
    module CocoonHelpers
      def sortable_label( label )
        ( content_tag(:span, '', class: 'ui-icon ui-icon-arrowthick-2-n-s',
          style: 'float: left; vertical-align: middle;') + label ).html_safe
      end

      def cocoon_fields( builder, association_name, fields_options = {}, &block  )
        singular_association_name = association_name.to_s.singularize
        label = fields_options.delete( :label ) || association_name.to_s.titleize
        ordered_by = fields_options.delete( :ordered_by )
        field_set_options = ordered_by.present? ? { data: { ordered_by: ordered_by } } : { }
        insertable = fields_options.delete( :insertable ) || false
        field_set_options[:class] = fields_options[:class] ? "#{fields_options[:class]} cocoon" : "cocoon"
        locals = fields_options.delete(:locals) || {}
        field_set_tag( label, field_set_options ) do
          out = builder.association association_name, fields_options do |f|
            render partial: "#{singular_association_name}_fields", locals: locals.merge( { f: f } )
          end
          out << if insertable
            content_tag(:div, class: 'links') do
              link_to_add_association( "Add #{singular_association_name.titleize}",
                builder, association_name, render_options: { locals: locals } )
            end
          else
            "".html_safe
          end
          out
        end
      end
    end
  end
end

