# frozen_string_literal: true
module BloomRemitClient
  module Requests
    module Credit
      class History < Requests::Base
        include Concerns::HasBaseAuthentification

        private

        def type
          Requests::GET
        end

        def path
          Requests.normalize_path(::BloomRemitClient::Credit::PATH, attributes.slice(:api_token), 'history')
        end
      end
    end
  end
end
