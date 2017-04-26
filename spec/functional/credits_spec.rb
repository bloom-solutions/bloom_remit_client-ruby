require 'spec_helper'

describe 'Base `credits` request' do
  let(:client) do
    config = CONFIG.slice(*%i(api_token api_secret))
    ::BloomRemitClient.new(config)
  end

  it "have success response", vcr: {record: :once} do
    pending
    expect(client.credits).to be_success
  end
end
