json.extract! store, :id, :name, :type, :price, :model, :description, :created_at, :updated_at
json.url store_url(store, format: :json)
