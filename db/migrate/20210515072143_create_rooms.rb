class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :introduction
      t.string :charge
      t.string :address
      t.string :room_image

      t.timestamps
    end
  end
end
