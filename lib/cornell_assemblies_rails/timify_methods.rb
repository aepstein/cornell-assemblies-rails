module CornellAssembliesRails
  module TimifyMethods
    def to_time
      begin
        return Date.iso8601(self).to_time
      rescue ArgumentError
        if ( sanitized = to_i ) > 0
          return Time.zone.at sanitized
        end
        nil
      end
    end
  end
end
