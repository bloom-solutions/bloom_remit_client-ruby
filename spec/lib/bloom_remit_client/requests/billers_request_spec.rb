require 'spec_helper'

module BloomRemitClient
  module Requests
    RSpec.describe BillersRequest, type: %i[model virtus] do

      it "inherits from BaseRequest" do
        expect(described_class < BaseRequest).to be true
      end

      describe "#path" do
        it "defaults to /api/v2/billers.json" do
          request = described_class.new(url: "https://hello.com")
          expect(request.endpoint).to eq "https://hello.com/api/v2/billers.json"
        end
      end

    end
  end
end
