class AddNametoAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :name, :string
  end
end
