require 'spec_helper'

module BloomRemitClient
  RSpec.describe Payment, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:id, String) }
      it { is_expected.to have_attribute(:teller_id, String) }
      it { is_expected.to have_attribute(:recipient_id, String) }
      it { is_expected.to have_attribute(:orig_currency, String) }
      it { is_expected.to have_attribute(:dest_currency, String) }
      it { is_expected.to have_attribute(:paid_in_orig_currency, Float) }
      it { is_expected.to have_attribute(:receivable_in_dest_currency, Float) }
      it { is_expected.to have_attribute(:status, String) }
      it { is_expected.to have_attribute(:payout_method, String) }
      it { is_expected.to have_attribute(:partner_id, String) }
      it { is_expected.to have_attribute(:flat_fee_in_orig_currency, Float) }
      it { is_expected.to have_attribute(:forex_margin, Float) }
      it { is_expected.to have_attribute(:account_name, String) }
      it { is_expected.to have_attribute(:account_number, String) }
      it { is_expected.to have_attribute(:callback_url, String) }
      it { is_expected.to have_attribute(:sender_id, String) }
    end

  end
end
