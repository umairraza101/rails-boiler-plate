json.extract! event, :id, :title, :start_date, :end_date, :description, :reference, :created_at, :updated_at
json.url event_url(event, format: :json)
