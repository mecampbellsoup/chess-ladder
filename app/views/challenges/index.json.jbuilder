json.array!(@challenges) do |challenge|
  json.extract! challenge, :winner_id, :loser_id
  json.url challenge_url(challenge, format: :json)
end
