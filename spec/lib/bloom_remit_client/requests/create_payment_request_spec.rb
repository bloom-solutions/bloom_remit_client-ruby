require 'spec_helper'

module BloomRemitClient
  RSpec.describe CreatePaymentRequest, type: %i[model virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:payment, Hash) }
      it { is_expected.to have_attribute(:sender_id, String) }
    end

    it "inherits from Base" do
      expect(described_class < Base).to be true
    end

    describe "#path" do
      it "defaults to /api/v2/payments" do
        request = described_class.new
        expect(request.path).to eq "/api/v2/payments.json"
      end
    end

  end
end
