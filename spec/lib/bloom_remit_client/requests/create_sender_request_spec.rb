require 'spec_helper'

module BloomRemitClient
  RSpec.describe CreateSenderRequest, type: %i[model virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:sender, Hash) }
    end

    it "inherits from BaseRequest" do
      expect(described_class < BaseRequest).to be true
    end

    describe "#path" do
      it "defaults to /api/v1/partners/:token/senders" do
        request = described_class.new(token: "token")
        expect(request.path).to eq "/api/v1/partners/token/senders.json"
      end
    end

  end
end
