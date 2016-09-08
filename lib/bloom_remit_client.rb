# frozen_string_literal: true
require 'virtus'
require 'httparty'
require 'active_model'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/try'
require 'bloom_remit_client/coercers/indifferent_hash'
require 'bloom_remit_client/concerns/has_base_authentification'
require "bloom_remit_client/version"
require "bloom_remit_client/client"
require "bloom_remit_client/models/biller"
require "bloom_remit_client/models/user"
require "bloom_remit_client/models/payment"
require "bloom_remit_client/models/credit"
require "bloom_remit_client/requests"
require "bloom_remit_client/requests/url_builder"
require "bloom_remit_client/requests/requests_sender"
require "bloom_remit_client/requests/base_request"
require "bloom_remit_client/requests/credit/list"
require "bloom_remit_client/requests/credit/history"
# require "bloom_remit_client/requests/billers_request"
# require "bloom_remit_client/requests/create_sender_request"
# require "bloom_remit_client/requests/create_payment_request"
# require "bloom_remit_client/responses/base_response"
# require "bloom_remit_client/responses/billers_response"
# require "bloom_remit_client/responses/create_sender_response"
# require "bloom_remit_client/responses/create_payment_response"

module BloomRemitClient
  PRODUCTION = 'api.bloom.solutions'
  STAGING = 'bloomremit-staging.herokuapp.com'

  class << self
    attr_accessor :sandbox
    attr_writer :host

    def new(*args)
      client = Client.new(*args)
      raise ArgumentError, client.errors.full_messages if client.invalid?
      client
    end

    def host
      return @host if @host
      sandbox ? STAGING : PRODUCTION
    end
  end
end
