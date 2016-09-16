require 'spec_helper'

RSpec.describe "Deposit strategies" do

  it "returns an array of deposit strategies", vcr: {record: :once} do
    client = BloomRemitClient.new

    response = client.deposit_strategies_list

    expect(response).to be_success
    deposit_strategies = response.deposit_strategies
    deposit_strategy = deposit_strategies.first
    expect(deposit_strategy.slug).to be_a String
    expect(deposit_strategy.name).to be_a String
  end

end
