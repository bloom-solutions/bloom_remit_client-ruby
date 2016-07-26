module BloomRemitClient
  class Client

    include Virtus.model
    attribute :token, String
    attribute :secret, String
    attribute :url, String

    include ActiveModel::Validations
    validates :token, :secret, :url, presence: true

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
