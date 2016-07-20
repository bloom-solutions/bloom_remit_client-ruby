require 'spec_helper'

module BloomRemitClient
  RSpec.describe BillersResponse, type: %i[virtus model] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:raw_response) }
      it { is_expected.to have_attribute(:billers, Array) }
    end

  end
end
