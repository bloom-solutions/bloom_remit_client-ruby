require 'spec_helper'

RSpec.describe "Billers List" do

  it "returns an array of billers", vcr: {record: :once} do
    client = BloomRemitClient.new(CONFIG.slice(:token, :secret))
    response = client.billers
    billers = response.billers

    expect(billers).to_not be_empty
    expect(billers.first.service_charge).to be_a Float
  end

end
