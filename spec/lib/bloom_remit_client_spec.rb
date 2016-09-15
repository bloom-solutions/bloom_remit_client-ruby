require 'spec_helper'

RSpec.describe BloomRemitClient do

  describe ".new" do
    describe "given valid credentials" do
      it "returns a client" do
        client = described_class.new({
          api_token: "asd",
          api_secret: "123",
          agent_id: "123",
        })
        expect(client).to be_a BloomRemitClient::Client
        expect(client.api_token).to eq "asd"
        expect(client.api_secret).to eq "123"
        expect(client.agent_id).to eq "123"
      end
    end

    describe "given invalid credentials" do
      it "raises an error" do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".host" do
    it "is STAGING by default" do
      described_class.sandbox = nil
      expect(described_class.host).to eq described_class::STAGING
    end

    it "is STAGING when sandbox = true" do
      described_class.sandbox = true
      expect(described_class.host).to eq described_class::STAGING
    end

    it "is PRODUCTION when sandbox = false" do
      described_class.sandbox = false
      expect(described_class.host).to eq described_class::PRODUCTION
    end
  end

end
