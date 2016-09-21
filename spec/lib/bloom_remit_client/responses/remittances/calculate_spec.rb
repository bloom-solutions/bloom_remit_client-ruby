require 'spec_helper'

module BloomRemitClient
  module Responses
    module Remittances
      RSpec.describe Calculate, type: %i[virtus] do

        describe "attributes" do
          subject { described_class }
          it { is_expected.to have_attribute(:origin_amount, Float) }
          it { is_expected.to have_attribute(:origin_currency, String) }
          it { is_expected.to have_attribute(:destination_amount, Float) }
          it { is_expected.to have_attribute(:destination_currency, String) }
          it do
            is_expected.to have_attribute(:flat_fee_in_orig_currency, Float)
          end
          it do
            is_expected.to have_attribute(:forex_fee_in_orig_currency, Float)
          end
          it do
            is_expected.to have_attribute(:payout_fee_in_orig_currency, Float)
          end
          it do
            is_expected.to have_attribute(:flat_fee_in_dest_currency, Float)
          end
          it do
            is_expected.to have_attribute(:payout_fee_in_dest_currency, Float)
          end
          it do
            is_expected.to have_attribute(:forex_fee_in_dest_currency, Float)
          end
        end

        %i[origin_currency destination_currency].each do |string_var|
          describe "##{string_var}" do
            let(:body) { { response: { string_var => "USD" } } }
            let(:client) { described_class.new(body: body) }
            subject { client.send(string_var) }
            it { is_expected.to eq "USD" }
          end
        end

        %i[
          origin_amount
          destination_amount
          flat_fee_in_orig_currency
          forex_fee_in_orig_currency
          payout_fee_in_orig_currency
          flat_fee_in_dest_currency
          payout_fee_in_dest_currency
          forex_fee_in_dest_currency
        ].each do |amount_var|
          describe "##{amount_var}" do
            let(:body) { { response: { amount_var => 20.5 } } }
            let(:client) { described_class.new(body: body) }
            subject { client.send(amount_var) }
            it { is_expected.to eq 20.5 }
          end
        end

      end
    end
  end
end
