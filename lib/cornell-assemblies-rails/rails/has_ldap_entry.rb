require 'cornell_ldap'

module CornellAssembliesRails
  module Rails
    module HasLdapEntry
      module ClassMethods
        def has_ldap_entry(key_field)
          instance_eval "def ldap_entry_key; :#{key_field}; end"
          include InstanceMethods
        end
      end

      module InstanceMethods
        def ldap_entry=(entry)
          @ldap_entry = entry
        end

        def ldap_entry
          return nil if @ldap_entry == false
          begin
            @ldap_entry ||= CornellLdap::Record.find send( self.class.ldap_entry_key )
          rescue Exception
            @ldap_entry = false
          end
        end
      end

      def self.included(receiver)
        receiver.extend         ClassMethods
      end

    end
  end
end

