require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OlevRailsS3
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.aws = config_for( :aws ).with_indifferent_access

    Aws.config[:region] = config.aws[:region]
    Aws.config[:http_proxy] = config.aws[:http_proxy]
  end
end
