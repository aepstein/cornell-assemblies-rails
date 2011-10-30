module CornellAssembliesRails
  module Rails
    module Searchable
      module ClassMethods
        def search_methods( *methods )
          instance_eval do
            def ransack_with_searchable( params={}, options={} )
              search_methods.each do |method|
                param = params.delete( method ) || params.delete( method.to_s )
                if param
                  send method, param
                end
              end
              ransack_without_searchable( params, options )
            end
          end
          unless defined? _search_methods
            send :include, InstanceMethods
            self._search_methods = []
          end
          self._search_methods += methods.flatten
        end
      end

      module InstanceMethods
        class << self
          cattr_accessor :_search_methods
          alias_method_chain :ransack, :searchable
        end
      end

      def self.included(receiver)
        receiver.extend         ClassMethods
      end
    end
  end
end

