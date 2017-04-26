require 'spec_helper'

RSpec.describe "Deposit strategies" do

  it "returns an array of deposit strategies", vcr: {record: :once} do
    client = BloomRemitClient.new

    response = client.deposit_strategies_list

    expect(response).to be_success
    deposit_strategies = response.deposit_strategies
    deposit_strategy = deposit_strategies.
      select{|ds| ds.category.present?}.
      sample
    expect(deposit_strategy.slug).to be_a String
    expect(deposit_strategy.name).to be_a String
    expect(%w(bank pickup)).to include(deposit_strategy.category)
    expect(deposit_strategies.map(&:country)).to include("PH")
  end

end
