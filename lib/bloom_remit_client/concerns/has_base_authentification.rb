# frozen_string_literal: true
module BloomRemitClient
  module Concerns
    module HasBaseAuthentification
      def self.included(base)
        base.class_eval do
          attribute :api_token, String
          attribute :api_secret, String

          validates :api_token, :api_secret, presence: true
        end
      end
    end
  end
end
