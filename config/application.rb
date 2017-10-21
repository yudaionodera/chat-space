require_relative 'boot'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module ChatSpace
  class Application < Rails::Application
  	#...
  	config.generators do |g|
  		g.assets false
  		g.helper false
  		g.javascripts false
  		g.test_framework false
      config.i18n.default_locale = :ja
  	end

    # config.before_configuration do
    #   I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    #   I18n.locale = :ja
    #   I18n.default_locale = :ja
    #   config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    #   config.i18n.locale = :ja
    #   # bypasses rails bug with i18n in production
    #   I18n.reload!
    #   config.i18n.reload!
    # end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :ja
    config.i18n.locale = :ja
    config.time_zone = 'Tokyo'
    config.generators do |g|
      g.javascripts false
      g.helper false
      g.test_frameworks false

    end
  end
end
