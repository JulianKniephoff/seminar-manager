json.array!(@talks) do |talk|
  json.extract! talk, :id, :title, :description, :speaker_id, :date
  json.url talk_url(talk, format: :json)
end
