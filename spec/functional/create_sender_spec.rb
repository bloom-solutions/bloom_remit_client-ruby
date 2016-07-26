require 'spec_helper'

RSpec.describe "Create sender" do

  it "creates a sender", vcr: {record: :once} do
    client = BloomRemitClient.new(CONFIG.slice(*%i[token secret agent_id url]))
    email = "#{SecureRandom.hex}@email.com"
    response = client.create_sender(
      first_name: "Luis",
      last_name: "Buenaventura",
      email: email,
      mobile: "+639175551111",
    )

    sender = response.sender

    expect(response).to be_success
    expect(sender.id).to be_present
    expect(sender.first_name).to eq "Luis"
    expect(sender.last_name).to eq "Buenaventura"
    expect(sender.email).to match(/@email\.com/)
    expect(sender.mobile).to eq "+639175551111"
  end

end
