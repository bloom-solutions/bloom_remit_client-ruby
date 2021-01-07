require 'spec_helper'

RSpec.describe "Create txn" do

  it "creates a transaction", vcr: {record: :once} do
    config = CONFIG.slice(*%i[partner_id api_secret])
    client = BloomRemitClient.new(config)

    client_external_id = SecureRandom.uuid

    response = client.create_txn(
      client_external_id: client_external_id,
      sender_first_name: Faker::Name.first_name,
      sender_last_name: Faker::Name.last_name,
      sender_email: Faker::Internet.email,
      sender_city: "Makati",
      sender_state: "MM",
      sender_country: "Philippines",
      sender_occupation: "Worker",
      recipient_first_name: "Jack",
      recipient_last_name: "Johnson",
      recipient_mobile: "+6398199818181",
      recipient_city: "Makati",
      recipient_state: "MM",
      recipient_country: "Philippines",
      recipient_occupation: "Worker",
      recipient_relationship_to_sender: "Bro",
      purpose: "Help",

      dest_currency: "PHP",
      receivable_in_dest_currency: 500,
      payout_method: "PLWNE",
      sender_zip_code: "1700",
      sender_address: "sender address",
      recipient_zip_code: "1700",
      recipient_address: "recipient address",
      account_name: "account name",
      account_number: "0123456789",
    )
    expect(response).to be_success, response.raw_response.body
    txn = response.txn
    expect(txn.id).to be_a String
    expect(txn.dest_currency).to eq "PHP"
    expect(txn.receivable_in_dest_currency).to eq 500.0
    expect(txn.status).to eq "waiting"
    expect(txn.payout_method).to eq "PLWNE"
    expect(txn.client_external_id).to be_present
  end

end
