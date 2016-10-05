module BloomRemitClient
  module Responses
    module Recipients
      class List < Base

        attribute(:recipients, Array, {
          lazy: true,
          default: :default_recipients,
        })

        private

        def default_recipients
          body.map { |hash| Recipient.new(hash) }
        end

      end
    end
  end
end
