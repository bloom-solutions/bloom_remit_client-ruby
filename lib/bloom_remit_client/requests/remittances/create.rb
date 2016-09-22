# frozen_string_literal: true
module BloomRemitClient
  module Requests
    module Remittances
      class Create < Base
        include Concerns::HasBaseAuthentification
        PATH = '/api/v1/partners/:api_token/senders/:sender_id/remittances'

        attribute :remittance, Hash
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
          attributes.slice(:agent_id, :recipient_id, :remittance)
        end
      end
    end
  end
end
