module CornellAssembliesRails
  module Rails
    module Searchable
      module ClassMethods
        def search_methods( *methods )
          unless method_defined? :_search_methods
            instance_eval do
              def search( params={}, options={} )
                return ransack( params, options ) if params.blank? || params.empty?
                s = _search_methods.inject( all ) do |scope, method|
                  param = params.delete( method ) || params.delete( method.to_s )
                  if param
                    scope.send method, param
                  else
                    scope
                  end
                end
                s.ransack( params, options )
              end
            end
            cattr_accessor :_search_methods
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

