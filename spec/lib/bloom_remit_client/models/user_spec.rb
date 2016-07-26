require 'spec_helper'

module BloomRemitClient
  RSpec.describe User, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:id, String) }
      it { is_expected.to have_attribute(:email, String) }
      it { is_expected.to have_attribute(:first_name, String) }
      it { is_expected.to have_attribute(:last_name, String) }
      it { is_expected.to have_attribute(:passport_number, String) }
      it { is_expected.to have_attribute(:passport_expiry_date, String) }
      it { is_expected.to have_attribute(:tin, String) }
      it { is_expected.to have_attribute(:mobile, String) }
      it { is_expected.to have_attribute(:address, String) }
      it { is_expected.to have_attribute(:city, String) }
      it { is_expected.to have_attribute(:state, String) }
      it { is_expected.to have_attribute(:zip_code, String) }
      it { is_expected.to have_attribute(:country, String) }
      it { is_expected.to have_attribute(:birthdate, String) }
    end

  end
end
