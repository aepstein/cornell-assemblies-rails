module CornellAssembliesRails
  module Rails
    module Searchable
      module ClassMethods
        def search_methods( *methods )
          unless defined? _search_methods
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
            cattr_accessor :_search_methods
            alias_method_chain :ransack, :searchable
            self._search_methods = []
          end
          self._search_methods += methods.flatten
        end
      end

      def self.included(receiver)
        receiver.extend         ClassMethods
      end
    end
  end
end

