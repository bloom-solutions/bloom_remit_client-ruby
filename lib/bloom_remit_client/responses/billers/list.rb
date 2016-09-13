module BloomRemitClient
  module Responses
    module Billers
      class List < Base

        attribute :billers, Array, lazy: true, default: :default_billers

        private

        def default_billers
          body.map { |hash| Biller.new(hash) }
        end

      end
    end
  end
end
