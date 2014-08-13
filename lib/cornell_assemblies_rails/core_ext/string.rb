require 'cornell_assemblies_rails/phone_methods'
require 'cornell_assemblies_rails/roman/string_methods'
require 'cornell_assemblies_rails/timify_methods'

class String
  include CornellAssembliesRails::PhoneMethods
  include CornellAssembliesRails::Roman::StringMethods
  include CornellAssembliesRails::TimifyMethods
end

