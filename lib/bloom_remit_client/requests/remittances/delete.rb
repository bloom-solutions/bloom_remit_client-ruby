# frozen_string_literal: true
module BloomRemitClient
  module Requests
    module Remittances
      class Delete < Base
        include Concerns::HasBaseAuthentification
        PATH = '/api/v1/partners/:api_token/senders/:sender_id/remittances'

        attribute :sender_id, String
        attribute :remittance_id, String

        validates :sender_id, :remittance_id, presence: true

        private

        def type
          DELETE
        end

        def path
          Requests.normalize_path(PATH, attributes.slice(:api_token, :sender_id), remittance_id)
        end
      end
    end
  end
end
