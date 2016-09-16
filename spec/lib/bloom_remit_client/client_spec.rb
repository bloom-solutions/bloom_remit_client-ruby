require 'spec_helper'

module BloomRemitClient
  RSpec.describe Client, type: %i[model virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:api_token, String) }
      it { is_expected.to have_attribute(:api_secret, String) }
      it { is_expected.to have_attribute(:host, String) }
      it do
        is_expected.to have_attribute(:sandbox). # Boolean
          with_default(true)
      end
    end

    describe "validations" do
      it { is_expected.to validate_presence_of(:host) }
    end

    describe "#host" do
      let(:client) { described_class.new(sandbox: sandbox) }
      subject(:host) { client.host }

      context "sandbox is true" do
        let(:sandbox) { true }
        it { is_expected.to eq BloomRemitClient::STAGING }
      end

      context "sandbox is not set" do
        let(:sandbox) { nil }
        it { is_expected.to eq BloomRemitClient::STAGING }
      end

      context "sandbox is false" do
        let(:sandbox) { false }
        it { is_expected.to eq BloomRemitClient::PRODUCTION }
      end
    end

  end
end
