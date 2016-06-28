Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['app_id'], ENV['app_secret'], scope: 'playlist-read-private user-read-private user-read-email'
end
