class CreateSolidQueueProcesses < ActiveRecord::Migration[8.1]
  def change
    create_table :solid_queue_processes do |t|
      t.string :name
      t.string :status
      t.datetime :last_run_at
      t.string :kind
      t.integer :pid
      t.string :hostname
      t.integer :supervisor_id
      t.timestamps
    end
  end
end
