require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  sensitive_vars = %w(api_token api_secret)
  sensitive_vars.each do |var|
    c.filter_sensitive_data("[#{var}]") { CONFIG[var] }
  end
end
