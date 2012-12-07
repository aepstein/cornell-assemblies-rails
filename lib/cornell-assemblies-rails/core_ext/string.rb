require 'cornell-assemblies-rails/phone_methods'
require 'cornell-assemblies-rails/roman/string_methods'

class String
  include CornellAssembliesRails::PhoneMethods
  include CornellAssembliesRails::Roman::StringMethods
end

