class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.integer :client_id
      t.integer :appointment_id
      t.integer :service_id

      t.timestamps
    end
  end
end
