require "instagram"

Instagram.configure do |config|
  config.client_id = ENV['INSTAGRAM_ID']
  config.client_secret = ENV['INSTAGRAM_SECRET']
end

CALLBACK_URL = "http://localhost:3000/insta_sessions/callback"
