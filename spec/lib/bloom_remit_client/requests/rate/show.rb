require 'spec_helper'

describe 'Rates request' do
  let(:rates_show) { ::BloomRemitClient::Requests::Rate::Show }
  let(:auth_params) { CONFIG.slice(*%i(api_token api_secret)).symbolize_keys }

  it "have success valid response without `currency`" do
    VCR.use_cassette('requests_rate_show', record: :new_episodes, match_requests_on: %i(uri)) do
      response = rates_show.new(auth_params).()
      expect(response).to be_success
      expect(response.code).to eq 200
      expect(response.body).not_to eq 'null'
    end
  end

  it "have success valid response with valid `currency`" do
    VCR.use_cassette('requests_rate_show', record: :new_episodes, match_requests_on: %i(uri)) do
      response = rates_show.new(currency: 'PHPBTC', **auth_params).()
      expect(response).to be_success
      expect(response.code).to eq 200
      expect(response.body.to_f).to be > 0
    end
  end

  it "have success(body == 'null') response with invalid `currency`" do
    VCR.use_cassette('requests_rate_show', record: :new_episodes, match_requests_on: %i(uri)) do
      response = rates_show.new(currency: 'invalid', **auth_params).()
      expect(response).to be_success
      expect(response.code).to eq 200 # But why?
      expect(response.body).to eq 'null'
    end
  end
end
