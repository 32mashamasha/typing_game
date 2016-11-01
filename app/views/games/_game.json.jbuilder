json.extract! game, :id, :score, :miss, :created_at, :updated_at
json.url game_url(game, format: :json)