require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module RpgEditor
  class Application < Rails::Application
    config.load_defaults 6.0
    config.action_controller.permit_all_parameters = true
  end
end
