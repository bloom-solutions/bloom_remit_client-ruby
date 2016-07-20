require 'spec_helper'

module BloomRemitClient
  RSpec.describe Biller, type: %i[virtus model] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:slug, String) }
      it { is_expected.to have_attribute(:description, String) }
      it { is_expected.to have_attribute(:first_field, String) }
      it { is_expected.to have_attribute(:first_field_format, String) }
      it { is_expected.to have_attribute(:first_field_width, Integer) }
      it { is_expected.to have_attribute(:second_field, String) }
      it { is_expected.to have_attribute(:second_field_format, String) }
      it { is_expected.to have_attribute(:second_field_width, Integer) }
      it { is_expected.to have_attribute(:service_charge, Float) }
    end

  end
end
