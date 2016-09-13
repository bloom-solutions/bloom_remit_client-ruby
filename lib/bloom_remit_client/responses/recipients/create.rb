module BloomRemitClient
  module Responses
    module Recipients
      class Create < Base

        attribute(:recipient, Object, {
          lazy: true,
          default: :default_recipient,
        })

        private

        def default_recipient
          Recipient.new(body[:recipient])
        end

      end
    end
  end
end
