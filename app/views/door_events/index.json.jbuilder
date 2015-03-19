json.array!(@door_events) do |door_event|
  json.extract! door_event, :event_type, :sensor_name
  json.url door_event_url(door_event, format: :json)
end
