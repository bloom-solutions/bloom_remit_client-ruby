# frozen_string_literal: true
require "api_client_base"
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/try'
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

  with_configuration do
    has :host, classes: String, default: STAGING
    has :partner_id, classes: String
    has :api_secret, classes: String
  end

end
