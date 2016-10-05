require 'spec_helper'

RSpec.describe "List recipients" do

  it "List recipients of a sender", vcr: {record: :once} do
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

    create_recipient_response = client.create_recipient(
      sender_id: sender.id,
      first_name: "Jack John",
      last_name: "S. Ong",
      mobile: "+6398199818181",
    )
    expect(create_recipient_response).to be_success

    response = client.recipient_list(sender_id: sender.id)
    expect(response).to be_success
    recipients = response.recipients
    expect(recipients).to_not be_empty
    recipient = recipient.first
    expect(recipient.id).to be_present
    expect(recipient.first_name).to eq "Jack John"
    expect(recipient.last_name).to eq "S. Ong"
    expect(recipient.mobile).to eq "+639175551111"
  end

end
