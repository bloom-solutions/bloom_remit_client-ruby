module BloomRemitClient
  module Requests
    module Billers
      class List < BaseRequest

        PATH = "/api/v2/billers.json"

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
