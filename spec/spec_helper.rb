$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "commission_hub_cj_graphql"

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = File.join(__dir__, 'fixtures', 'cassettes')
  config.hook_into :webmock
  config.filter_sensitive_data('<API_TOKEN>') { ENV['CJ_API_KEY'] }
  config.filter_sensitive_data('<PUBLISHER_ID>') { ENV['CJ_PUBLISHER_ID'] }
end