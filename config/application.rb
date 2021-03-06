require File.expand_path('../boot', __FILE__)

if ENV['HEROKU_DEPLOYING'].nil?
  require 'rails/all'
else
  require "action_controller/railtie"
  require "action_mailer/railtie"
  require "sprockets/railtie"
  require "rails/test_unit/railtie"
end



# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module ControlSwitch
  class Application < Rails::Application

    #config.middleware.delete "ActionDispatch::ShowExceptions"
    #config.middleware.delete "ActionDispatch::DebugExceptions"
    #config.middleware.delete "ActionDispatch::Flash"
    #config.middleware.delete "ActionDispatch::BestStandardsSupport"
    #config.middleware.use Faye::RackAdapter, :mount => '/faye', :timeout => 25

  end
end
