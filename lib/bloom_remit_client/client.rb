# frozen_string_literal: true
module BloomRemitClient
  class Client
    include Virtus.model
    include ActiveModel::Validations

    attribute :api_token, String
    attribute :api_secret, String
    attribute :agent_id, String
    attribute :host, String, lazy: true, default: :default_host
    attribute :sandbox, Boolean, default: true

    validates :host, presence: true
    validates :sandbox, inclusion: { in: [true, false] }

    # GET
    # /api/v1/partners/:api_token/credits
    # Parameters: none
    def credits(params = {})
      request_params = params.merge(access_params)
      request = Requests::Credit::List.new(request_params)
      request.call!
    end

    # GET
    # /api/v1/partners/:api_token/credits/history
    # Parameters: none
    def credits_history(params = {})
      request_params = params.merge(access_params)
      request = Requests::Credit::History.new(request_params)
      request.call!
    end

    # GET
    # /api/v1/rates
    # Parameters:
    #   partner_id:
    #     String, required
    #     API token
    #   api_secret:
    #     String, required
    #   currency:
    #     One of: [USDPHP, USDUSD, USDKRW, USDAUD, USDCAD, USDJPY, USDNZD, USDSGD, USDHKD,
    #              USDCNY, USDEUR, USDVND, USDSAR, USDTWD, USDQAR, USDKWD, USDAED, USDGBP,
    #              USDMYR, USDINR, USDIDR, USDBTC],
    #     optional
    def rates(params = {})
      request_params = params.merge(access_params)
      request = Requests::Rate::Show.new(request_params)
      request.call!
    end

    def billers(params={})
      request_params = params.merge(access_params)
      request = Requests::Billers::List.new(request_params)
      raw_response = request.call!
      Responses::Billers::List.new(raw_response: raw_response)
    end

    def create_sender(sender_params={})
      params = {sender: sender_params}
      request_params = params.merge(default_params).merge(access_params)
      request = Requests::Senders::Create.new(request_params)
      raw_response = request.call!
      Responses::Senders::Create.new(raw_response: raw_response)
    end

    def create_payment(payment_params={})
      params = {payment: payment_params}.
        merge(sender_id: payment_params[:sender_id])
      request_params = params.merge(default_params).merge(access_params)
      request = Requests::Payments::Create.new(request_params)
      raw_response = request.call!
      Responses::Payments::Create.new(raw_response: raw_response)
    end

    def create_recipient(recipient_params={})
      params = {recipient: recipient_params}.
        merge(sender_id: recipient_params[:sender_id])
      request_params = params.merge(default_params).merge(access_params)
      request = Requests::Recipients::Create.new(request_params)
      raw_response = request.call!
      Responses::Recipients::Create.new(raw_response: raw_response)
    end

    def recipient_list(recipient_params={})
      request_params = recipient_params.merge(access_params)
      request = Requests::Recipients::List.new(request_params)
      raw_response = request.call!
      Responses::Recipients::List.new(raw_response: raw_response)
    end

    def create_remittance(remittance_params={})
      params = {remittance: remittance_params}.
        merge(sender_id: remittance_params[:sender_id]).
        merge(recipient_id: remittance_params[:recipient_id])
      request_params = params.merge(default_params).merge(access_params)
      request = Requests::Remittances::Create.new(request_params)
      raw_response = request.call!
      Responses::Remittances::Create.new(raw_response: raw_response)
    end

    def calculate_remittance(calculate_params={})
      params = access_params.merge(calculate_params)
      request = Requests::Remittances::Calculate.new(params)
      raw_response = request.call!
      Responses::Remittances::Calculate.new(raw_response: raw_response)
    end

    def deposit_strategies_list
      request_params = access_params
      request = Requests::DepositStrategies::List.new(request_params)
      raw_response = request.call!
      Responses::DepositStrategies::List.new(raw_response: raw_response)
    end

    def create_txn(txn_params={})
      params = {txn: txn_params}.merge(
        sender_id: txn_params[:sender_id],
        recipient_id: txn_params[:recipient_id],
      )
      request_params = params.merge(default_params).merge(access_params)
      request = Requests::Txns::Create.new(request_params)
      raw_response = request.call!
      Responses::Txns::Create.new(raw_response: raw_response)
    end

    private

    # Should overwrite any other `:api_token`, `:api_secret`
    def access_params
      @access_params ||= attributes.slice(:host, :api_token, :api_secret)
    end

    def default_params
      @default_params ||= attributes.slice(:agent_id)
    end

    def default_host
      return BloomRemitClient::STAGING if self.sandbox.nil? || self.sandbox
      BloomRemitClient::PRODUCTION
    end

  end
end
