
ENV["RAILS_ENV"] = "test"


require File.expand_path('../../test_app/config/environment', __FILE__)

require "rspec/rails"
require "nokogiri"

# Load support files
#Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each{|f| require f}

RSpec.configure do |config|

  require 'rspec/expectations'

  config.include RSpec::Matchers
#  config.include EditMode::TestHelpers

  config.mock_with :rspec
end

# Capybara.default_wait_time = 5
