json.extract! feedback, :id, :rate, :descr, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
