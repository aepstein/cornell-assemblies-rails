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
          unless @notifiable_events
            has_many :notices, as: :notifiable, dependent: :destroy
            scope :no_notice, lambda { |event|
              where { |c| c.id.not_in( Notice.for_event(event).
                for_type( "#{self}" ) ) }
            }
            scope :no_notice_since, lambda { |event, point|
              where { |c| c.id.not_in( Notice.for_event(event).
                for_type( "#{self}" ).since( point ) ) }
            }
          end
          @notifiable_events ||= Array.new
          options = events.extract_options!
          return @notifiable_events if events.empty?
          ifs = [ options.delete( :if ) || [] ].flatten.map(&:to_s).join(' && ')
          ifs = "return false unless #{ifs}" unless ifs.empty?
          unlesses = [ options.delete( :unless ) || [] ].flatten.map(&:to_s).join(' || ')
          unlesses = "return false if #{unlesses}" unless unlesses.empty?
          new_events = events - notifiable_events
          new_events.flatten.each do |event|
            scope "no_#{event}_notice".to_sym, lambda { no_notice( event ) }
            scope "no_#{event}_notice_since".to_sym, lambda { |point|
              no_notice_since( event, point )
            }
            class_eval <<-RUBY
              def send_#{event}_notice!
                return false unless persisted?
                #{ifs}
                #{unlesses}
                message = #{self}Mailer.#{event}_notice( self ).deliver
                notice = Notice.create( message: message, event: "#{event}", notifiable: self )
                logger.info "Sent #{event} notice (\#{notice.id}) for #{self}#\#{id} to: " +
                  "\#{message.to}, cc: \#{message.cc}, bcc: \#{message.bcc}."
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

