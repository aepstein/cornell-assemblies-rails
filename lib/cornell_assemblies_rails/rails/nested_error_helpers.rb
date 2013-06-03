module CornellAssembliesRails
  module Rails
    module NestedErrorHelpers

      def nested_errors(object)
        return nil if object.errors.empty?
        e = object.errors.inject([]) do |errors, (attribute, message)|
          if attribute =~ /\./
            nested_attribute = object.send( attribute.to_s.match( /^([^\.]+)\./ )[1] )
            if nested_attribute.respond_to?(:each)
              nested_attribute.each do |nested_object|
                errors << nested_errors( nested_object )
              end
            else
              errors << nested_errors( nested_object )
            end
          else
            if attribute == :base
              errors << message
            else
              errors << "#{attribute} #{message}"
            end
          end
          errors
        end
        "#{object} has the following errors:\n".html_safe + (
        content_tag( :ul ) do
          e.map { |error| error.present? ? content_tag( :li, error ) : '' }.
            join("\n").html_safe
        end )
      end

    end
  end
end

