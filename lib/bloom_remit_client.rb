# frozen_string_literal: true
require "api_client_base"
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/try'
require "message_bus_client_worker"
require 'bloom_remit_client/coercers/indifferent_hash'
require "bloom_remit_client/version"
require "bloom_remit_client/client"
require "bloom_remit_client/models/txn"
require "bloom_remit_client/requests"
require "bloom_remit_client/requests/create_txn_request"
require "bloom_remit_client/responses/create_txn_response"

module BloomRemitClient

  PRODUCTION = 'https://www.bloomremit.net'
  STAGING = 'https://staging.bloomremit.net'

  include APIClientBase::Base.module

  TXN_UPDATES_CHANNEL = "/v2/txns".freeze

  with_configuration do
    has :host, classes: String, default: STAGING
    has :partner_id, classes: String
    has :api_secret, classes: String
    has :on_txn_update, classes: [String, NilClass]
  end

  def self.configure_message_bus_client_worker!
    if configuration.on_txn_update.blank?
      fail "`on_txn_update` must be defined"
    end

    token = [
      configuration.partner_id,
      configuration.api_secret,
    ].join(":")
    token = Base64.strict_encode64(token)

    MessageBusClientWorker.subscribe(configuration.host, {
      headers: {
        "HTTP_AUTHORIZATION" => "Basic #{token}"
      },
      channels: {
        TXN_UPDATES_CHANNEL => { processor: configuration.on_txn_update },
      }
    })
  end

end
