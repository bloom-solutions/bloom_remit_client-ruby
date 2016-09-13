require 'spec_helper'

module BloomRemitClient
  RSpec.describe Recipient, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:id, String) }
      it { is_expected.to have_attribute(:first_name, String) }
      it { is_expected.to have_attribute(:last_name, String) }
      it { is_expected.to have_attribute(:mobile, String) }
      it { is_expected.to have_attribute(:email, String) }
      it { is_expected.to have_attribute(:address, String) }
      it { is_expected.to have_attribute(:city, String) }
      it { is_expected.to have_attribute(:state, String) }
      it { is_expected.to have_attribute(:country, String) }
      it { is_expected.to have_attribute(:postal_code, String) }
    end

  end
end
