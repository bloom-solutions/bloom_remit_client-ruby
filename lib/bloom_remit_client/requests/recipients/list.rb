module BloomRemitClient
  module Requests
    module Recipients
      class List < Base

        include Concerns::HasBaseAuthentification

        PATH = "/api/v1/partners/:api_token/senders/:sender_id/recipients.json"

        # attribute :recipient, Hash
        # attribute :agent_id, String
        attribute :sender_id, String

        private

        def path
          Requests.normalize_path(PATH, attributes.slice(
            :api_token,
            :sender_id,
          ))
        end

        def type
          GET
        end

        def body_params
          attributes.slice(*%i[recipient_id])
        end

      end
    end
  end
end
