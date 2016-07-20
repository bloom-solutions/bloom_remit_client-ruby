module BloomRemitClient
  class Client

    DEFAULT_URL = "https://bloom.solutions"

    include Virtus.model
    attribute :token, String
    attribute :secret, String
    attribute :url, String, default: DEFAULT_URL

    include ActiveModel::Validations
    validates :token, :secret, presence: true

    def billers
      request = BillersRequest.new(default_opts)
      raw_response = request.()
      BillersResponse.new(raw_response: raw_response)
    end

    private

    def default_opts
      attributes.slice(:token, :secret, :url)
    end

  end
end
