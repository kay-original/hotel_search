json.extract! reservation, :id, :user_id, :started_at, :finished_at, :peoples, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
