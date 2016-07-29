module BloomRemitClient
  class Client

    include Virtus.model
    attribute :token, String
    attribute :secret, String
    attribute :agent_id, String
    attribute :url, String

    include ActiveModel::Validations
    validates :token, :secret, :agent_id, :url, presence: true

    def billers
      request = BillersRequest.new(default_opts)
      raw_response = request.()
      BillersResponse.new(raw_response: raw_response)
    end

    def create_sender(opts)
      request = CreateSenderRequest.new(default_opts.merge(sender: opts))
      raw_response = request.()
      CreateSenderResponse.new(raw_response: raw_response)
    end

    def create_payment(opts)
      params = default_opts.
        merge(sender_id: opts.delete(:sender_id)).
        merge(payment: opts)
      request = CreatePaymentRequest.new(params)
      CreatePaymentResponse.new(raw_response: request.())
    end

    private

    def default_opts
      attributes.slice(:token, :secret, :url, :agent_id)
    end

  end
end
