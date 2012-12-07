require 'cornell-assemblies-rails/roman'

module CornellAssembliesRails
  module Roman
    module StringMethods
      def to_i_from_roman
        value = self.upcase
        ROMAN_DIGITS.values.reverse.inject(0) do |result, roman|
          while value.start_with? roman
            value = value.slice(roman.length, value.length)
            result += ROMAN_DIGITS.key roman
          end
          result
        end
      end
    end
  end
end

