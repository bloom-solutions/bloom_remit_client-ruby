require 'spec_helper'

module BloomRemitClient
  module Responses
    RSpec.describe Base, type: %i[virtus model] do

      describe "attributes" do
        subject { described_class }
        it { is_expected.to have_attribute(:raw_response) }
        it { is_expected.to have_attribute(:body) }
        it { is_expected.to have_attribute(:success) }
      end

      describe "#body" do
        let(:raw_response) do
          instance_double(HTTParty::Response, body: raw_body)
        end
        let(:response) { described_class.new(raw_response: raw_response) }

        context "raw body is a json 'hash'" do
          let(:raw_body) { {"i_am": "z body"}.to_json }
          it "is the `to_hash`ed version of the response" do
            expect(response.body).
              to eq({i_am: "z body"}.with_indifferent_access)
          end
        end

        context "raw body is a json array" do
          let(:raw_body) { [{"i_am": "z body"}].to_json }
          it "is the `to_hash`ed version of the response" do
            expect(response.body).
              to eq([{i_am: "z body"}.with_indifferent_access])
          end
        end
      end

    end
  end
end
