json.array!(@links) do |link|
  json.extract! link, :id, :user_id, :title, :link_type, :url, :description, :images
  json.url link_url(link, format: :json)
end
