require 'spec_helper'

module BloomRemitClient
  RSpec.describe Client, type: %i[model virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:token, String) }
      it { is_expected.to have_attribute(:secret, String) }
      it { is_expected.to have_attribute(:agent_id, String) }
      it { is_expected.to have_attribute(:url, String) }
    end

    describe "validations" do
      it { is_expected.to validate_presence_of(:token) }
      it { is_expected.to validate_presence_of(:secret) }
      it { is_expected.to validate_presence_of(:agent_id) }
      it { is_expected.to validate_presence_of(:url) }
    end

  end
end
