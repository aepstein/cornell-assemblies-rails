class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.integer :notifiable_id, null: false
      t.string :notifiable_type, null: false
      t.string :event, null: false
      t.timestamp :created_at, null: false
    end
  end
end
