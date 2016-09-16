require 'spec_helper'

module BloomRemitClient
  module Requests
    RSpec.describe Base, type: %i[model virtus] do

      describe "attributes" do
        subject { described_class }
        it { is_expected.to have_attribute(:host, String) }
      end

      describe "validations" do
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

      describe "#call!" do
        let(:request_class) { Class.new(described_class) }
        let(:request) { request_class.new(host: nil) }

        it "fails if the request is invalid" do
          expect { request.call! }.to raise_error(ArgumentError)
        end
      end

    end
  end
end
