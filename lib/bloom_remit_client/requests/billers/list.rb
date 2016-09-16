module BloomRemitClient
  module Requests
    module Billers
      class List < Base

        include Concerns::HasBaseAuthentification

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
