require 'spec_helper'

module BloomRemitClient
  module Requests
    RSpec.describe Base, type: %i[model virtus] do

      describe "attributes" do
        subject { described_class }
        it { is_expected.to have_attribute(:api_token, String) }
        it { is_expected.to have_attribute(:api_secret, String) }
        it { is_expected.to have_attribute(:host, String) }
      end

      describe "validations" do
        it { is_expected.to validate_presence_of(:api_token) }
        it { is_expected.to validate_presence_of(:api_secret) }
        it { is_expected.to validate_presence_of(:host) }
      end

      describe "#params" do
        let(:request_class) do
          Class.new(described_class) do
            def type; Requests::GET; end
            def path; "/path"; end
          end
        end
        let(:request) { request_class.new(host: "abc.com") }

        it "uses the host set in the base request" do
          expect(request.params[:url][:host]).to eq "abc.com"
        end
      end

    end
  end
end
