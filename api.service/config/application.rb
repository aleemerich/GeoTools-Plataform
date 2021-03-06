require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module ApiArichComBr
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true
    config.assets.enabled = true
    config.assets.initialize_on_precompile = false
    config.assets.version = '1.0'

    # Permitindo chamadas cross-browser
    config.middleware.use Rack::Cors do |requests|
      requests.allow do |allow|
        allow.origins '*'
        allow.resource '*', :headers => :any, :methods => [:get, :post, :delete, :put, :options]
      end
    end
  end
end
