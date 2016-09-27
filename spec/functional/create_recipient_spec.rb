require 'spec_helper'

RSpec.describe "Create recipient" do

  it "Sends a recipient", vcr: {record: :once} do
    config = CONFIG.slice(*%i[api_token api_secret agent_id sandbox])
    client = BloomRemitClient.new(config)

    sender_response = client.create_sender(
      first_name: "Luis",
      last_name: "Buenaventura",
      email: "#{SecureRandom.hex}@email.com",
      mobile: "+639175551111",
    )
    expect(sender_response).to be_success
    sender = sender_response.sender

    response = client.create_recipient(
      sender_id: sender.id,
      first_name: "Jack John",
      last_name: "S. Ong",
      mobile: "+6398199818181",
    )
    expect(response).to be_success

    recipient = response.recipient
    expect(recipient.first_name).to eq "Jack John"
    expect(recipient.last_name).to eq "S. Ong"
    expect(recipient.mobile).to eq "+6398199818181"
  end

end
