module CornellAssembliesRails
  module Rails
    module Breadcrumbs
      module ClassMethods

        def has_breadcrumbs
          attr_accessor :breadcrumbs
          helper_method :breadcrumbs

          instance_eval do
            # Add a breadcrumb as before_filter action for the controller
            # See instance method for details on name, url
            # Options are passed to before_filter
            def add_breadcrumb name, url, options = {}
              before_filter options do |controller|
                controller.send(:add_breadcrumb, name, url)
              end
            end
          end

          send :include, InstanceMethods
        end

      end

      module InstanceMethods
        # Add a breadcrumb navigation level
        # * name: The text to display
        # * url: The url for the link
        def add_breadcrumb name, url = ''
          self.breadcrumbs ||= []
          url = eval(url) if url =~ /_path|_url|@/
          self.breadcrumbs << [name, url]
        end
      end

      def self.included(receiver)
        receiver.extend         ClassMethods
      end
    end
  end
end

