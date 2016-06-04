ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort if Rails.env.production?

require 'spec_helper'
require 'rspec/rails'
require 'capybara/poltergeist'
require 'shoulda/matchers'
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.include FactoryGirl::Syntax::Methods
  Capybara.javascript_driver = :poltergeist
  config.infer_spec_type_from_file_location!
  config.backtrace_exclusion_patterns << /gems/

  Shoulda::Matchers.configure do |u|
    u.integrate do |with|
      # Choose a test framework:
      with.test_framework :rspec

      # Choose one or more libraries:
      with.library :active_record
      with.library :active_model
      with.library :action_controller
      # Or, choose the following (which implies all of the above):
      with.library :rails
    end
  end
end
