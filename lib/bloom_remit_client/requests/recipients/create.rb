module BloomRemitClient
  module Requests
    module Recipients
      class Create < Base

        PATH = "/api/v1/partners/:api_token/senders/:sender_id/recipients.json"

        attribute :recipient, Hash
        attribute :agent_id, String
        attribute :sender_id, String

        private

        def path
          PATH.gsub(":api_token", self.api_token).
            gsub(":sender_id", self.sender_id)
        end

        def type
          POST
        end

        def body_params
          attributes.slice(*%i[agent_id recipient])
        end

      end
    end
  end
end
