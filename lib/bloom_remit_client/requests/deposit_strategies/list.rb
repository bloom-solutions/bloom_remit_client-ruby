module BloomRemitClient
  module Requests
    module DepositStrategies
      class List < Base

        PATH = "/api/v1/strategies.json"

        private

        def type
          Requests::GET
        end

        def path
          PATH
        end

      end
    end
  end
end
