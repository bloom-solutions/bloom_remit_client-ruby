module BloomRemitClient
  class CreatePaymentRequest < Base

    PATH = "/api/v2/payments.json"

    attribute :payment, Hash
    attribute :sender_id, String

    def call
      HTTParty.post(self.endpoint, body: params)
    end

    private

    def default_path
      PATH
    end

    def params
      {
        api_token: token,
        api_secret: secret,
        agent_id: agent_id,
        sender_id: sender_id,
        payment: payment,
      }
    end

  end
end
