module CornellAssembliesRails
  module TimeRoundingMethods
    def floor(seconds = 60)
      Time.zone.at((self.to_f / seconds).floor * seconds)
    end

    def ceil(seconds = 60)
      Time.zone.at((self.to_f / seconds).ceil * seconds)
    end
  end
end

