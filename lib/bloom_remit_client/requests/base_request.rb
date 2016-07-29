module BloomRemitClient
  class BaseRequest

    include Virtus.model
    attribute :token, String
    attribute :secret, String
    attribute :url, String
    attribute :agent_id, String
    attribute :path, String, lazy: true, default: :default_path
    attribute :endpoint, String, lazy: true, default: :default_endpoint

    include ActiveModel::Validations
    validates :token, :secret, :url, :path, presence: true

    def call
      HTTParty.get(self.endpoint)
    end

    private

    def default_endpoint
      return nil if self.url.nil?
      uri = URI.parse(self.url)
      uri.path = path
      uri.to_s
    end

  end
end
