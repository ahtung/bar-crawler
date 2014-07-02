# spec/rails_helper.rb
ENV["RAILS_ENV"] ||= 'test'

require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/poltergeist'
require 'helpers'
Capybara.javascript_driver = :poltergeist

Geocoder.configure(:lookup => :test)

Geocoder::Lookup::Test.add_stub(
  "Fahreheitstraat 102, Den Haag", [
    {
      'latitude'     => 40.7143528,
      'longitude'    => -74.0059731,
      'address'      => 'New York, NY, USA',
      'state'        => 'New York',
      'state_code'   => 'NY',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)

Geocoder::Lookup::Test.add_stub(
  "Buijs Ballotstraat 106, Den Haag", [
    {
      'latitude'     => 40.7143528,
      'longitude'    => -74.0059731,
      'address'      => 'New York, NY, USA',
      'state'        => 'New York',
      'state_code'   => 'NY',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)


Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true
  
  config.include Helpers

  config.infer_spec_type_from_file_location!
end
