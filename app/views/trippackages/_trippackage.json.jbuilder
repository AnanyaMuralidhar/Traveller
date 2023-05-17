json.extract! trippackage, :id, :package_name, :destination, :departure, :arrival, :budget, :description, :created_at, :updated_at
json.url trippackage_url(trippackage, format: :json)
