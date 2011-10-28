module CornellAssembliesRails
  module Rails
    module Authenticable
      module ClassMethods
        def is_authenticable
          has_secure_password
          before_validation :initialize_password, :on => :create
          include InstanceMethods
        end
      end

      module InstanceMethods

        protected

        # Generates and sets a random, secure 8 character password if none
        # is already set
        def initialize_password
          if password.blank?
            chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
            newpass = ""
            1.upto(8) { |i| newpass << chars[rand(chars.size-1)] }
            self.password, self.password_confirmation = newpass, newpass
          end
          true
        end
      end

      def self.included(receiver)
        receiver.extend         ClassMethods
      end
    end
  end
end

