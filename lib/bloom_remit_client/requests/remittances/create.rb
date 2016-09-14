module BloomRemitClient
  module Requests
    module Remittances
      class Create < Base

        PATH = "/api/v1//partners/:api_token/senders/:sender_id/remittances.json"

        attribute :remittance, Hash
        attribute :sender_id, String
        attribute :recipient_id, String

        private

        def path
          PATH.gsub(":api_token", self.api_token).
            gsub(":sender_id", self.sender_id)
        end

        def type
          POST
        end

        def body_params
          attributes.slice(*%i[recipient_id remittance])
        end

      end
    end
  end
end
