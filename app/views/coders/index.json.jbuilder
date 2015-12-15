json.array!(@coders) do |coder|
  json.extract! coder, :id, :name, :email, :github_username
  json.url coder_url(coder, format: :json)
end
