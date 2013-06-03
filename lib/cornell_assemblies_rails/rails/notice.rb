module CornellAssembliesRails
  module Rails
    class Notice < ActiveRecord::Base
      attr_accessible :notifiable, :event, :message
      belongs_to :notifiable, polymorphic: true
      validates :notifiable, presence: true
      validates :event, presence: true
      attr_accessor :message

      after_create :archive_message
      after_destroy :expunge_message
      
      scope :for_type, lambda { |type| where { |n| n.notifiable_type.
        eq( type ) }.select { notifiable_id } }
      scope :for_event, lambda { |event| where { |n| n.event.eq( event ) } }
      scope :since, lambda { |point| where { |n| n.created_at.gte( point ) } }

      def partitioned_model_id
        ("%09d" % id).scan(/\d{3}/).join("/")
      end
      
      def directory_for_message
        "#{::Rails.root}/db/uploads/notices/#{partitioned_model_id}"
      end

      def path_for_message
        "#{directory_for_message}/message.eml"
      end

      def archive_message
        return true unless message
        FileUtils.mkdir_p( directory_for_message )
        f = File.open(path_for_message, 'w')
        f << message.to_s
        f.close
        update_column :archived_at, Time.zone.now
      end

      def expunge_message
        File.delete( path_for_message ) if message_path
        update_column :archived_at, nil unless destroyed?
      end

      def message_path
        return nil unless archived_at && File.exists?( path_for_message )
        path_for_message
      end
    end
  end
end
