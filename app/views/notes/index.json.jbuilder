json.array!(@notes) do |note|
  json.extract! note, :id, :username, :message
  json.url note_url(note, format: :json)
end
