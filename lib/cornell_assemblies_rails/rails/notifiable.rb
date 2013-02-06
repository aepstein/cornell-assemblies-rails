module CornellAssembliesRails
  module Rails
    module Notifiable
      module InstanceMethods
      end

      module ClassMethods

        # Defines events for which notices may be sent
        # Generates the following class methods for each event:
        # no_event_notice: All records for which no notice has been sent
        # no_event_notice_since( time ): All records for which no notice sent
        #  or no notice sent since specified time
        # Generates the following instance methods:
        # send_event_notice!: Sends notice regarding event and records timestamp
        # Allowed options:
        # * :if => symbol or array of symmbols of instance methods to call before
        #   sending notice -- will not send notice if any of these returns false
        # * :unless => symbol or array of symbols of instance methods to call before
        #   sending notice -- will not send if any of these does not return (nil|false)
        def notifiable_events( *events )
          @notifiable_events ||= Array.new
          options = events.extract_options!
          return @notifiable_events if events.empty?
          ifs = [ options.delete( :if ) || [] ].flatten.map(&:to_s).join(' && ')
          ifs = "return false unless #{ifs}" unless ifs.empty?
          unlesses = [ options.delete( :unless ) || [] ].flatten.map(&:to_s).join(' || ')
          unlesses = "return false if #{unlesses}" unless unlesses.empty?
          new_events = events - notifiable_events
          new_events.flatten.each do |event|
            scope "no_#{event}_notice".to_sym, where( "#{event}_notice_at".to_sym => nil )
            scope "no_#{event}_notice_since".to_sym, lambda { |time|
              t = arel_table
              f = arel_table["#{event}_notice_at".to_sym]
              where( f.eq( nil ).or( f.lt( time ) ) )
            }
            class_eval <<-RUBY
              def send_#{event}_notice!
                return false unless persisted?
                #{ifs}
                #{unlesses}
                message = #{self}Mailer.#{event}_notice( self ).deliver
                logger.info "Sent #{event} notice for #{self}#\#{id} to: " +
                  "\#{message.to}, cc: \#{message.cc}, bcc: \#{message.bcc}."
                self.update_column :#{event}_notice_at, Time.zone.now
              end
            RUBY
          end
          @notifiable_events += new_events
        end

      end

      def self.included(receiver)
        receiver.extend         ClassMethods
        receiver.send :include, InstanceMethods
      end
    end
  end
end

