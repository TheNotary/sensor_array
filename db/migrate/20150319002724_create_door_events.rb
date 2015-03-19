class CreateDoorEvents < ActiveRecord::Migration
  def change
    create_table :door_events do |t|
      t.string :event_type
      t.string :sensor_name

      t.timestamps
    end
  end
end
