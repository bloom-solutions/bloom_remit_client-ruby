module BloomRemitClient
  module Requests
    module Remittances
      class Calculate < Base

        include Concerns::HasBaseAuthentification

        PATH = "/api/v1//partners/:api_token/remittances/calculate.json"

        attribute :origin_amount, Float
        attribute :origin_currency, String
        attribute :destination_amount, Float
        attribute :destination_currency, String
        attribute :payout_method, String

        private

        def path
          PATH.gsub(":api_token", self.api_token)
        end

        def type
          POST
        end

        def body_params
          attributes
        end

      end
    end
  end
end
