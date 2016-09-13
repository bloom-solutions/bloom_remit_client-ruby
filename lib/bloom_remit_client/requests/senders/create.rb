module BloomRemitClient
  module Requests
    module Senders
      class Create < Base

        PATH = "/api/v1/partners/:token/senders.json"

        attribute :sender, Hash

        private

        def path
          PATH.gsub(":token", self.api_token)
        end

        def type
          POST
        end

        def body_params
          { sender: sender }
        end

      end
    end
  end
end
