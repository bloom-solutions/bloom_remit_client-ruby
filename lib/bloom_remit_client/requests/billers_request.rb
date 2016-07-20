module BloomRemitClient
  class BillersRequest

    PATH = "/api/v2/billers.json"

    include Virtus.model
    attribute :token, String
    attribute :secret, String
    attribute :url, String
    attribute :endpoint, String, lazy: true, default: :default_endpoint

    include ActiveModel::Validations
    validates :token, :secret, :url, :endpoint, presence: true

    def call
      HTTParty.get(self.endpoint)
    end

    private

    def default_endpoint
      return nil if self.url.nil?
      uri = URI.parse(self.url)
      uri.path = PATH
      uri.to_s
    end

  end
end
