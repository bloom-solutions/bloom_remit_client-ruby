require 'spec_helper'

module BloomRemitClient
  RSpec.describe BaseRequest, type: %i[model virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:token, String) }
      it { is_expected.to have_attribute(:secret, String) }
      it { is_expected.to have_attribute(:url, String) }
      it do
        is_expected.to have_attribute(:path, String).with_default(:default_path)
      end
      it do
        is_expected.to have_attribute(:endpoint, String).
          with_default(:default_endpoint)
      end
    end

    describe "validations" do
      it { is_expected.to validate_presence_of(:token) }
      it { is_expected.to validate_presence_of(:secret) }
      it { is_expected.to validate_presence_of(:url) }
      it { is_expected.to validate_presence_of(:path) }
    end

    describe "#endpoint" do
      it "defaults to url + path" do
        request = described_class.new(url: "https://hello.com", path: "/path")
        expect(request.endpoint).to eq "https://hello.com/path"
      end
    end

  end
end
