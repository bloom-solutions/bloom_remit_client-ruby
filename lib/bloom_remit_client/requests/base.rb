# frozen_string_literal: true
module BloomRemitClient
  module Requests
    class Base
      include Virtus.model
      include ActiveModel::Validations
      attribute :host, String
      validates :host, presence: true

      def call
        RequestsSender.call(params)
      end

      def call!
        raise(ArgumentError, errors.full_messages) if invalid?
        call
      end

      def params
        {
          type: type,
          body: body,
          url: {
            host: host,
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
