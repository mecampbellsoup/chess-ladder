json.array!(@players) do |player|
  json.extract! player, :name, :ranking
  json.url player_url(player, format: :json)
end
