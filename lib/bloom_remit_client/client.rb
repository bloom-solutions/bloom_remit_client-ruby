# frozen_string_literal: true
module BloomRemitClient
  class Client
    include Virtus.model
    include ActiveModel::Validations

    attribute :api_token, String
    attribute :api_secret, String
    attribute :agent_id, String
    attribute :host, String

    validates :api_token, :api_secret, :host, presence: true

    # GET
    # /api/v1/partners/:api_token/credits
    # Parameters: none
    def credits(params = {})
      request_params = params.merge(access_params)
      Requests::Credit::List.new(request_params).()
    end

    # GET
    # /api/v1/partners/:api_token/credits/history
    # Parameters: none
    def credits_history(params = {})
      request_params = params.merge(access_params)
      Requests::Credit::History.new(request_params).()
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
      Requests::Rate::Show.new(request_params).()
    end

    def billers(params={})
      request_params = params.merge(access_params)
      raw_response = Requests::Billers::List.new(request_params).()
      Responses::Billers::List.new(raw_response: raw_response)
    end

    def create_sender(sender_params={})
      params = {sender: sender_params}
      request_params = params.merge(default_params).merge(access_params)
      raw_response = Requests::Senders::Create.new(request_params).()
      Responses::Senders::Create.new(raw_response: raw_response)
    end

    def create_payment(payment_params={})
      params = {payment: payment_params}.
        merge(sender_id: payment_params[:sender_id])
      request_params = params.merge(default_params).merge(access_params)
      raw_response = Requests::Payments::Create.new(request_params).()
      Responses::Payments::Create.new(raw_response: raw_response)
    end

    def create_recipient(recipient_params={})
      params = {recipient: recipient_params}.
        merge(sender_id: recipient_params[:sender_id])
      request_params = params.merge(default_params).merge(access_params)
      raw_response = Requests::Recipients::Create.new(request_params).()
      Responses::Recipients::Create.new(raw_response: raw_response)
    end

    def create_remittance(remittance_params={})
      params = {remittance: remittance_params}.
        merge(sender_id: remittance_params[:sender_id]).
        merge(recipient_id: remittance_params[:recipient_id])
      request_params = params.merge(default_params).merge(access_params)
      raw_response = Requests::Remittances::Create.new(request_params).()
      Responses::Remittances::Create.new(raw_response: raw_response)
    end

    private

    # Should overwrite any other `:api_token`, `:api_secret`
    def access_params
      @access_params ||= attributes.slice(:host, :api_token, :api_secret)
    end

    def default_params
      @default_params ||= attributes.slice(:agent_id)
    end
  end
end
