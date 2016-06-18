# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ApiArichComBr::Application.initialize!

ENV['RAILS_ENV'] = 'production'
ENV['GEM_PATH'] = '/home/euteajudo/.gems/gems'
