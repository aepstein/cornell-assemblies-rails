require 'cornell_assemblies_rails/time_rounding_methods'

Time.send :include, CornellAssembliesRails::TimeRoundingMethods
ActiveSupport::TimeWithZone.send :include, CornellAssembliesRails::TimeRoundingMethods

