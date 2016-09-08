# frozen_string_literal: true
module BloomRemitClient
  module Requests
    class BaseRequest
      include Virtus.model
      include ActiveModel::Validations
      include Concerns::HasBaseAuthentification

      def call
        RequestsSender.new(params).()
      end

      def params
        {
          type: type,
          body: body,
          url: {
            host: ::BloomRemitClient.host,
            path: path,
            query_params: query_params
          }
        }
      end

      private

      def type
        raise NotImplementedError, 'For subclass only!'
      end

      def path
        raise NotImplementedError, 'For subclass only!'
      end

      def body
        return unless body_params.present?
        body_params.to_json
      end

      def body_params
        {}
      end

      def query_params
        attributes.slice(:api_secret)
      end
    end
  end
end
