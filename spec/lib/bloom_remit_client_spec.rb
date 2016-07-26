require 'spec_helper'

RSpec.describe BloomRemitClient do

  describe ".new" do
    describe "given valid credentials" do
      it "returns a client" do
        client = described_class.new({
          token: "asd",
          secret: "123",
          url: "url.com",
        })
        expect(client).to be_a BloomRemitClient::Client
        expect(client.token).to eq "asd"
        expect(client.secret).to eq "123"
        expect(client.url).to eq "url.com"
      end
    end

    describe "given invalid credentials" do
      it "raises an error" do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end

end
