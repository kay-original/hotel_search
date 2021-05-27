class ChangeDatatypePofileImageIdOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :profile_image_id, :text
  end
end
