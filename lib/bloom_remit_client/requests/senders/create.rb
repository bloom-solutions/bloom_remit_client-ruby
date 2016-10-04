module BloomRemitClient
  module Requests
    module Senders
      class Create < Base

        include Concerns::HasBaseAuthentification

        PATH = "/api/v1/partners/:token/senders.json"

        attribute :sender, Hash
        attribute :agent_id, String

        private

        def path
          PATH.gsub(":token", self.api_token)
        end

        def type
          POST
        end

        def body_params
          attributes.slice(:agent_id, :sender)
        end

      end
    end
  end
end
