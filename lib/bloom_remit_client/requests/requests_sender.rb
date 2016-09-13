# frozen_string_literal: true
module BloomRemitClient
  module Requests
    class RequestsSender
      include Virtus.model
      include ActiveModel::Validations

      attribute :type, String
      attribute :body, String
      attribute :headers, Hash, lazy: true, default: ->(object, attribute) { RequestsSender.default_headers }
      attribute :url, Requests::UrlBuilder

      validates :type, presence: true, inclusion: Requests::REQUEST_TYPES

      def self.default_headers
        @default_headers ||= {
          'Content-Type' => Requests::CONTENT_TYPE_JSON_UTF8,
          'Accept' => Requests::CONTENT_TYPE_JSON
        }
      end

      def call
        HTTParty.send(type, url.(), body: body, headers: headers)
      end
    end
  end
end
