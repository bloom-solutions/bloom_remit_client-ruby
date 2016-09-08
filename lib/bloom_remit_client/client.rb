# frozen_string_literal: true
module BloomRemitClient
  class Client
    include Virtus.model
    include ActiveModel::Validations

    attribute :api_token, String
    attribute :api_secret, String
    attribute :agent_id, String

    validates :api_token, :api_secret, presence: true

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

    private

    # Should overwrite any other `:api_token`, `:api_secret`
    def access_params
      @access_params ||= attributes.slice(:api_token, :api_secret)
    end

    def default_params
      @default_params ||= attributes.slice(:agent_id)
    end
  end
end
