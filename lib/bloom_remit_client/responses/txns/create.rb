module BloomRemitClient
  module Responses
    module Txns
      class Create < Base

        attribute(:txn, Object, {
          lazy: true,
          default: :default_txn,
        })

        private

        def default_txn
          Remittance.new(body[:txn])
        end

      end
    end
  end
end
