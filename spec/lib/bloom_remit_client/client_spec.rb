require 'spec_helper'

module BloomRemitClient
  RSpec.describe Client, type: %i[model virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:api_token, String) }
      it { is_expected.to have_attribute(:api_secret, String) }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of(:api_token) }
      it { is_expected.to validate_presence_of(:api_secret) }
    end

  end
end
