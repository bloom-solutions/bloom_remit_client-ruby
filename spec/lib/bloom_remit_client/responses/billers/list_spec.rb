require 'spec_helper'

module BloomRemitClient
  module Responses
    module Billers
      RSpec.describe List, type: %i[virtus model] do

        it "inherits from Base" do
          expect(described_class < Base).to be true
        end

        describe "attributes" do
          subject { described_class }
          it { is_expected.to have_attribute(:billers, Array) }
        end

      end
    end
  end
end
