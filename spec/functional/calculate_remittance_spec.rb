require 'spec_helper'

RSpec.describe "Calculate remittance" do

  it "gets the costs of a remittance", vcr: {record: :once} do
    config = CONFIG.slice(*%i[api_token api_secret agent_id])
    client = BloomRemitClient.new(config)

    deposit_strategy = client.deposit_strategies_list.
      deposit_strategies.sample

    response = client.calculate_remittance(
      origin_currency: "USD",
      destination_amount: 8_500.0,
      destination_currency: "PHP",
      payout_method: deposit_strategy.slug,
    )

    expect(response.origin_amount).to be_a Float
    expect(response.origin_currency).to eq "USD"
    expect(response.destination_amount).to eq 8_500.0
    expect(response.destination_currency).to eq "PHP"
    expect(response.flat_fee_in_orig_currency).to be_a Float
    expect(response.forex_fee_in_orig_currency).to be_a Float
    expect(response.payout_fee_in_orig_currency).to be_a Float
    expect(response.flat_fee_in_dest_currency).to be_a Float
    expect(response.payout_fee_in_dest_currency).to be_a Float
    expect(response.forex_fee_in_dest_currency).to be_a Float
  end

end
