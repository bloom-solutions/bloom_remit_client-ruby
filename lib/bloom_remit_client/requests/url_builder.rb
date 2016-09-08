module BloomRemitClient
  module Requests
    class UrlBuilder
      require 'addressable/uri'
      include Virtus.model
      include ActiveModel::Validations

      attribute :scheme, String, default: 'https'
      attribute :subdomain, String
      attribute :userinfo, String
      attribute :path, String
      attribute :host, String
      attribute :port, Integer
      attribute :query, String
      attribute :query_params, Hash, default: {}
      attribute :fragment, String

      validates :path, :host, :scheme, presence: true
      validates :scheme, inclusion: ['https', 'http']

      def call
        builder.build(to_h).to_s
      end

      def host
        return super unless subdomain.present?
        "#{subdomain}.#{super}"
      end

      def path
        raw_path = super
        return raw_path if !raw_path.is_a?(String) || raw_path[0] == '/'
        "/#{raw_path}"
      end

      def query
        super || build_query
      end

      private

      def builder
        case scheme
        when 'http'
          URI::HTTP
        when 'https'
          URI::HTTPS
        end
      end

      def build_query
        Addressable::URI.new(query_values: query_params).query
      end
    end
  end
end
