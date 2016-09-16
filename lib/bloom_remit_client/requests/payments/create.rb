module BloomRemitClient
  module Requests
    module Payments
      class Create < Base

        include Concerns::HasBaseAuthentification

        PATH = "/api/v2/payments.json"

        attribute :payment, Hash
        attribute :sender_id, String
        attribute :agent_id, String

        private

        def path
          PATH
        end

        def type
          POST
        end

        def body_params
          attributes.slice(*%i[api_token agent_id sender_id payment])
        end

      end
    end
  end
end
