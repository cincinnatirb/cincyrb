require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cincirb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Use admin layout for Devise views
    config.to_prepare do
      Devise::SessionsController.layout 'admin'
      Devise::RegistrationsController.layout proc { |_| user_signed_in? ? 'application' : 'admin' }
      Devise::ConfirmationsController.layout 'admin'
      Devise::UnlocksController.layout 'admin'
      Devise::PasswordsController.layout 'admin'
    end
  end
end
