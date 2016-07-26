module BloomRemitClient
  class CreateSenderRequest < BaseRequest

    PATH = "/api/v1/partners/:token/senders.json"

    attribute :sender, Hash

    def call
      HTTParty.post(self.endpoint, body: params)
    end

    private

    def default_path
      PATH.gsub(":token", self.token)
    end

    def params
      { api_secret: secret, sender: sender }
    end

  end
end
