require 'spec_helper'

module BloomRemitClient
  RSpec.describe Client, type: %i[model virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:token, String) }
      it { is_expected.to have_attribute(:secret, String) }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of(:token) }
      it { is_expected.to validate_presence_of(:secret) }
    end

  end
end
