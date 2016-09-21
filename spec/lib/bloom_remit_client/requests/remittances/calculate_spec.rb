require 'spec_helper'

module BloomRemitClient
  module Requests
    module Remittances
      RSpec.describe Calculate, type: %i[model virtus] do

        it "inherits from Base" do
          expect(described_class < Base).to be true
        end

        describe "attributes" do
          subject { described_class }
          it { is_expected.to have_attribute(:origin_amount, Float) }
          it { is_expected.to have_attribute(:origin_currency, String) }
          it { is_expected.to have_attribute(:destination_amount, Float) }
          it { is_expected.to have_attribute(:destination_currency, String) }
          it { is_expected.to have_attribute(:payout_method, String) }
        end

      end
    end
  end
end
