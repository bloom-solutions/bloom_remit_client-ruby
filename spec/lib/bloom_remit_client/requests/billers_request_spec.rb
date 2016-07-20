require 'spec_helper'

module BloomRemitClient
  RSpec.describe BillersRequest, type: %i[model virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:token, String) }
      it { is_expected.to have_attribute(:secret, String) }
      it { is_expected.to have_attribute(:url, String) }
      it { is_expected.to have_attribute(:endpoint, String) }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of(:token) }
      it { is_expected.to validate_presence_of(:secret) }
      it { is_expected.to validate_presence_of(:url) }
      it { is_expected.to validate_presence_of(:endpoint) }
    end

    describe "#endpoint" do
      it "defaults to /api/v2/billers.json" do
        request = described_class.new(url: "https://hello.com")
        expect(request.endpoint).to eq "https://hello.com/api/v2/billers.json"
      end
    end

  end
end
