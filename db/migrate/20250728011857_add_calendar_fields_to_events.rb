class AddCalendarFieldsToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :description, :text
    add_column :events, :location, :string
    add_column :events, :all_day, :boolean, default: false
    add_column :events, :status, :string, default: 'confirmed'
    add_column :events, :visibility, :string, default: 'default'
    add_column :events, :recurrence_rule, :text
    add_column :events, :color_id, :string
    add_column :events, :attendees, :json
    add_column :events, :reminders, :json
    add_column :events, :creator_email, :string
    add_column :events, :organizer_email, :string
    add_column :events, :ical_uid, :string
    add_column :events, :timezone, :string, default: 'UTC'

    add_index :events, :status
    add_index :events, :all_day
  end
end
