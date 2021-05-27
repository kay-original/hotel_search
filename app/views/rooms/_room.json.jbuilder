json.extract! room, :id, :name, :introduction, :charge, :address, :room_image, :created_at, :updated_at
json.url room_url(room, format: :json)
