class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.date :started_at
      t.date :finished_at
      t.integer :peoples

      t.timestamps
    end
  end
end
