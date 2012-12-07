require 'cornell-assemblies-rails/currency_methods'
require 'cornell-assemblies-rails/roman/integer_methods'

class Integer
  include CornellAssembliesRails::CurrencyMethods
  include CornellAssembliesRails::Roman::IntegerMethods
end

