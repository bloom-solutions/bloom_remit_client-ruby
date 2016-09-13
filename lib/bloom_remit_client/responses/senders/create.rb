module BloomRemitClient
  module Responses
    module Senders
      class Create < Base

        attribute :sender, Object, lazy: true, default: :default_sender

        def success?
          raw_response.success?
        end

        private

        def default_sender
          User.new(body[:sender])
        end

      end
    end
  end
end
