require 'spec_helper'

RSpec.describe "Create remittance" do

  it "Sends a remittance", vcr: {record: :once} do
    config = CONFIG.slice(*%i[api_token api_secret agent_id])
    client = BloomRemitClient.new(config)

    sender_response = client.create_sender(
      first_name: "Luis",
      last_name: "Buenaventura",
      email: "#{SecureRandom.hex}@email.com",
      mobile: "+639175551111",
    )
    expect(sender_response).to be_success
    sender = sender_response.sender

    recipient_response = client.create_recipient(
      sender_id: sender.id,
      first_name: "Jack",
      last_name: "Johnson",
      mobile: "+6398199818181",
    )
    expect(recipient_response).to be_success
    recipient = recipient_response.recipient

    response = client.create_remittance(
      sender_id: sender.id,
      recipient_id: recipient.id,
      account_name: "Jack Johnson",
      account_number: "1234567890",
      callback_url: "http://callback.com/callback",
      dest_currency: "PHP",
      orig_currency: "KRW",
      flat_fee_in_orig_currency: 3000,
      paid_in_orig_currency: 15000,
      payout_method: "BDO",
      receivable_in_dest_currency: 500,
    )
    expect(response).to be_success
    remittance = response.remittance
    expect(remittance.id).to be_a String
    expect(remittance.recipient_id).to eq recipient.id
    expect(remittance.orig_currency).to eq "KRW"
    expect(remittance.dest_currency).to eq "PHP"
    expect(remittance.paid_in_orig_currency).to eq 15000.0
    expect(remittance.receivable_in_dest_currency).to eq 500.0
    expect(remittance.status).to eq "incomplete"
    expect(remittance.payout_method).to eq "BDO"
    expect(remittance.forex_margin).to eq 0.0
    expect(remittance.account_name).to eq "Jack Johnson"
    expect(remittance.account_number).to eq "1234567890"
    expect(remittance.callback_url).to eq "http://callback.com/callback"
    expect(remittance.sender_id).to eq sender.id
  end

end
