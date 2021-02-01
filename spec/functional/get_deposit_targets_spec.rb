require 'spec_helper'

RSpec.describe "Get deposit targets" do

  it "gets all deposit targets", vcr: {record: :once} do
    config = CONFIG.slice(*%i[partner_id api_secret])
    client = BloomRemitClient.new(config)

    response = client.get_deposit_targets

    expect(response).to be_success, response.raw_response.body

    deposit_targets = response.deposit_targets
    dt = deposit_targets.first

    aggregate_failures do
      expect(dt).to be_a(BloomRemitClient::DepositTarget)
      expect(dt).to respond_to(:slug)
      expect(dt).to respond_to(:name)
      expect(dt).to respond_to(:active)
      expect(dt).to respond_to(:wait_time)
      expect(dt).to respond_to(:support_line)
      expect(dt).to respond_to(:sameday_cutoff)
      expect(dt).to respond_to(:maximum)
      expect(dt).to respond_to(:availability)
      expect(dt).to respond_to(:availability_daynames)
      expect(dt).to respond_to(:currencies)
      expect(dt).to respond_to(:required_fields)
      expect(dt).to respond_to(:type)
      expect(dt).to respond_to(:iso_code)
      expect(dt).to respond_to(:data)
      expect(dt).to respond_to(:country)
    end
  end

end
