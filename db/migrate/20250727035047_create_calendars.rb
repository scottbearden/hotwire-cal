class CreateCalendars < ActiveRecord::Migration[8.0]
  def change
    create_table :calendars do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
