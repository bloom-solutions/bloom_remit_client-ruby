module BloomRemitClient
  module Responses
    module Payments
      class Create < Base

        attribute :payment, Object, lazy: true, default: :default_payment

        private

        def default_payment
          Payment.new(body[:payment])
        end

      end
    end
  end
end
