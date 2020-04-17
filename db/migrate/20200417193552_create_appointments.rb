class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :time
      t.integer :budget
      t.text :notes
      t.integer :client_id
      t.integer :service_id

      t.timestamps
    end
  end
end
