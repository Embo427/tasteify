require_relative 'boot'
require 'rails/all'
require 'yaml'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
creds = YAML::load_file(File.join(__dir__, 'application.yml'))
RSpotify::authenticate(creds["spotify_client_id"], creds["spotify_client_secret"])

module Tasteify
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
