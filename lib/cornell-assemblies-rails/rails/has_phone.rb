module CornellAssembliesRails
  module Rails
    module HasPhone
      module ClassMethods
        def has_phone(*attributes)
          attributes.each do |attribute|
            class_eval <<-RUBY
              def #{attribute}(style=nil)
                return super if super.blank?
                super.to_phone(style)
              end
            RUBY
          end
          include InstanceMethods
        end
      end

      module InstanceMethods
      end

      def self.included(receiver)
        receiver.extend         ClassMethods
      end

    end
  end
end

