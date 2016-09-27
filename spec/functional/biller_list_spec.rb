require 'spec_helper'

RSpec.describe "Biller List" do

  it "returns an array of billers", vcr: {record: :once} do
    config = CONFIG.slice(*%i[api_token api_secret agent_id sandbox])
    client = BloomRemitClient.new(config)
    response = client.billers
    billers = response.billers

    expect(billers).to_not be_empty
    expect(billers.first.service_charge).to be_a Float
  end

end
