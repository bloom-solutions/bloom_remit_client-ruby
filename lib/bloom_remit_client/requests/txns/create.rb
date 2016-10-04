# frozen_string_literal: true
module BloomRemitClient
  module Requests
    module Txns
      class Create < Base
        include Concerns::HasBaseAuthentification
        PATH = "/api/v3/txns"

        attribute :txn, Hash
        attribute :sender_id, String
        attribute :recipient_id, String
        attribute :agent_id, String

        private

        def path
          Requests.normalize_path(PATH, attributes.slice(:api_token, :sender_id))
        end

        def type
          POST
        end

        def body_params
          attributes.slice(*%i[api_token agent_id recipient_id sender_id txn])
        end
      end
    end
  end
end
