module BloomRemitClient
  module Responses
    module DepositStrategies
      class List < Base

        attribute(:deposit_strategies, Array, {
          lazy: true,
          default: :default_deposit_strategies,
        })

        private

        def default_deposit_strategies
          body.map { |hash| DepositStrategy.new(hash) }
        end

      end
    end
  end
end
