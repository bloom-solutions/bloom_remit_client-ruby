require 'spec_helper'

module BloomRemitClient
  module Requests
    module Payments
      RSpec.describe Create, type: %i[model virtus] do

        it "inherits from Base" do
          expect(described_class < Base).to be true
        end

        describe "attributes" do
          subject { described_class }
          it { is_expected.to have_attribute(:payment, Hash) }
          it { is_expected.to have_attribute(:sender_id, String) }
        end

      end
    end
  end
end
