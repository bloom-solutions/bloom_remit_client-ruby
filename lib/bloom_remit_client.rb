# frozen_string_literal: true
require 'virtus'
require 'httparty'
require 'active_model'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/try'
require 'bloom_remit_client/coercers/indifferent_hash'
require 'bloom_remit_client/coercers/path'
require 'bloom_remit_client/concerns/has_base_authentification'
require "bloom_remit_client/version"
require "bloom_remit_client/client"
require "bloom_remit_client/models/biller"
require "bloom_remit_client/models/deposit_strategy"
require "bloom_remit_client/models/user"
require "bloom_remit_client/models/payment"
require "bloom_remit_client/models/remittance"
require "bloom_remit_client/models/credit"
require "bloom_remit_client/models/recipient"
require "bloom_remit_client/requests"
require "bloom_remit_client/requests/url_builder"
require "bloom_remit_client/requests/requests_sender"
require "bloom_remit_client/requests/base"
require "bloom_remit_client/requests/credit/list"
require "bloom_remit_client/requests/credit/history"
require "bloom_remit_client/requests/rate/show"
require "bloom_remit_client/requests/billers/list"
require "bloom_remit_client/requests/deposit_strategies/list"
require "bloom_remit_client/requests/senders/create"
require "bloom_remit_client/requests/payments/create"
require "bloom_remit_client/requests/remittances/create"
require "bloom_remit_client/requests/remittances/delete"
require "bloom_remit_client/requests/recipients/create"
require "bloom_remit_client/requests/remittances/calculate"
require "bloom_remit_client/responses/base"
require "bloom_remit_client/responses/billers/list"
require "bloom_remit_client/responses/deposit_strategies/list"
require "bloom_remit_client/responses/senders/create"
require "bloom_remit_client/responses/payments/create"
require "bloom_remit_client/responses/remittances/create"
require "bloom_remit_client/responses/remittances/delete"
require "bloom_remit_client/responses/recipients/create"
require "bloom_remit_client/responses/remittances/calculate"

module BloomRemitClient
  PRODUCTION = 'api.bloom.solutions'
  STAGING = 'bloomremit-staging.herokuapp.com'

  class << self
    attr_accessor :host
    attr_accessor :sandbox

    def new(args = {})
      client = Client.new(default_args.merge(args))
      raise ArgumentError, client.errors.full_messages if client.invalid?
      client
    end

    private

    def default_args
      { sandbox: sandbox }
    end
  end
end
