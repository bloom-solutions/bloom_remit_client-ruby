require 'spec_helper'

module BloomRemitClient
  RSpec.describe DepositStrategy, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:slug, String) }
      it { is_expected.to have_attribute(:name, String) }
    end

  end
end
