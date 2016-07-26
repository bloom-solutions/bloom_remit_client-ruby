require 'spec_helper'

module BloomRemitClient
  RSpec.describe BaseResponse, type: %i[virtus model] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:raw_response) }
    end

  end
end
