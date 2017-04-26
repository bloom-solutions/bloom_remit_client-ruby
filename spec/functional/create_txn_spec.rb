require 'spec_helper'

RSpec.describe "Create txn" do

  context "payment" do
    it "creates a payment", vcr: {record: :once} do
      pending
      config = CONFIG.slice(*%i[api_token api_secret agent_id])
      client = BloomRemitClient.new(config)

      sender_response = client.create_sender(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email
      )
      expect(sender_response).to be_success
      sender = sender_response.sender

      billers_response = client.billers
      billers = billers_response.billers
      expect(billers).to_not be_empty
      biller = billers.find {|biller| biller.slug == "PLDT"}

      client_external_id = SecureRandom.uuid

      response = client.create_txn(
        sender_id: sender.id,
        account_name: "Jack Johnson",
        account_number: "1234567890",
        callback_url: "http://callback.com/callback",
        target_slug: biller.slug,
        amount: 500,
        client_external_id: client_external_id,
      )
      expect(response).to be_success
      txn = response.txn
      expect(txn.id).to be_a String
      expect(txn.orig_currency).to eq "PHP"
      expect(txn.dest_currency).to eq "PHP"
      expect(txn.receivable_in_dest_currency).to eq 500.0
      expect(txn.status).to eq "incomplete"
      expect(txn.payout_method).to eq "PLDT"
      expect(txn.forex_margin).to eq 0.0
      expect(txn.account_name).to eq "Jack Johnson"
      expect(txn.account_number).to eq "1234567890"
      expect(txn.callback_url).to eq "http://callback.com/callback"
      expect(txn.sender_id).to eq sender.id
    end
  end

  context "remittance" do
    it "creates a remittance", vcr: {record: :once} do
      config = CONFIG.slice(*%i[api_token api_secret agent_id])
      client = BloomRemitClient.new(config)

      sender_response = client.create_sender(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email
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

      client_external_id = SecureRandom.uuid

      response = client.create_txn(
        sender_id: sender.id,
        recipient_id: recipient.id,
        account_name: "Jack Johnson",
        account_number: "1234567890",
        callback_url: "http://callback.com/callback",
        currency: "PHP",
        target_slug: "BDOI",
        amount: 500,
        client_external_id: client_external_id,
      )
      expect(response).to be_success
      txn = response.txn
      expect(txn.id).to be_a String
      expect(txn.recipient_id).to eq recipient.id
      expect(txn.orig_currency).to eq "PHP"
      expect(txn.dest_currency).to eq "PHP"
      expect(txn.receivable_in_dest_currency).to eq 500.0
      expect(txn.status).to eq "incomplete"
      expect(txn.payout_method).to eq "BDOI"
      expect(txn.forex_margin).to eq 0.0
      expect(txn.account_name).to eq "Jack Johnson"
      expect(txn.account_number).to eq "1234567890"
      expect(txn.callback_url).to eq "http://callback.com/callback"
      expect(txn.sender_id).to eq sender.id
    end
  end

end
