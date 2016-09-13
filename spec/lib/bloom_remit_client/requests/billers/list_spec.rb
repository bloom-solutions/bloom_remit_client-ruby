require 'spec_helper'

module BloomRemitClient
  module Requests
    module Billers
      RSpec.describe List, type: %i[model virtus] do

        it "inherits from Base" do
          expect(described_class < Base).to be true
        end

      end
    end
  end
end
