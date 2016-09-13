# frozen_string_literal: true
module BloomRemitClient
  module Requests
    module Rate
      class Show < Requests::BaseRequest
        PATH = '/api/v1/rates'

        attribute :currency, String

        private

        def type
          Requests::GET
        end

        def path
          PATH
        end

        def query_params
          attributes.slice(:api_secret, :currency).merge(partner_id: api_token)
        end
      end
    end
  end
end
