module BloomRemitClient
  class BaseRequest

    include APIClientBase::Request.module

    attribute :host, String
    attribute :partner_id, String
    attribute :api_secret, String

    def headers
      {
        "X-API-PARTNER-ID" => partner_id,
        "X-API-SECRET" => api_secret,
      }
    end

  end
end