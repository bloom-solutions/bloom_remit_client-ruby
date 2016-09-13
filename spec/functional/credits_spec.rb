require 'spec_helper'

describe 'Base `credits` request' do
  let(:client) { ::BloomRemitClient.new(CONFIG.slice(*%i(api_token api_secret))) }

  it "have success response" do
    VCR.use_cassette('client_credits', record: :once) do
      expect(client.credits).to be_success
    end
  end
end
