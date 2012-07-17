module CornellAssembliesRails
  module Rails
    module HasPhone
      module ClassMethods
        def has_phone(*attributes)
          attributes.each do |attribute|
            define_method( attribute ) do
              return super if super.blank?
              super.to_phone
            end
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

