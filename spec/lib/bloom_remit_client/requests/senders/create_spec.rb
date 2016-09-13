require 'spec_helper'

module BloomRemitClient
  module Requests
    module Senders
      RSpec.describe Create, type: %i[model virtus] do

        it "inherits from BaseRequest" do
          expect(described_class < BaseRequest).to be true
        end

        describe "attributes" do
          subject { described_class }
          it { is_expected.to have_attribute(:sender, Hash) }
        end

      end
    end
  end
end
