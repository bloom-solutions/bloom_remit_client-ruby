require 'spec_helper'

RSpec.describe "Create payment" do

  it "Pay for a bill", vcr: {record: :once} do
    client = BloomRemitClient.new(CONFIG.slice(*%i[token secret agent_id url]))

    sender_response = client.create_sender(
      first_name: "Luis",
      last_name: "Buenaventura",
      email: "#{SecureRandom.hex}@email.com",
      mobile: "+639175551111",
    )
    expect(sender_response).to be_success
    sender = sender_response.sender

    billers_response = client.billers
    billers = billers_response.billers
    expect(billers).to_not be_empty

    biller = billers.find {|biller| biller.slug == "PLDT"}

    payment_response = client.create_payment(
      sender_id: sender.id,
      account_name: "028815252",
      account_number: "1234567890",
      callback_url: "http://callback.com/callback",
      dest_currency: "PHP",
      orig_currency: "KRW",
      paid_in_orig_currency: 15000,
      payout_method: biller.slug,
      receivable_in_dest_currency: 500
    )
    expect(payment_response).to be_success
  end

end
