json.array!(@comments) do |comment|
  json.extract! comment, :id, :author_id, :idea_id, :content
  json.url comment_url(comment, format: :json)
end
