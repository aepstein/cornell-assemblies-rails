module CornellAssembliesRails
  module Rails
    module FlashHelpers

      def flash_messages
        flash.inject([]) { |memo, ( type, message )|
          memo.push( content_tag( :div, class: "alert #{bootstrap_class_for(type)}" ) do
            content_tag( :button, "&#215;".html_safe,
              :class => "close", "data-dismiss" => "alert" ) + h(message)
          end )
        }.inject(&:+)
      end

      def bootstrap_class_for( flash_type )
        case flash_type
          when :success
            "alert-success"
          when :error
            "alert-error"
          when :alert
            "alert-block"
          when :notice
            "alert-info"
          else
            flash_type.to_s
        end
      end

    end
  end
end

