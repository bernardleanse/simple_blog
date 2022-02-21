ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative './db_helpers/truncate_test_tables'
require_relative './features/web_helpers/sign_up_and_log_in.rb'


Capybara.app = SimpleBlog

RSpec.configure do |config|

  config.before(:each) do
    truncate_test_tables
  end
 
  config.expect_with :rspec do |expectations|
 
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|
   
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
