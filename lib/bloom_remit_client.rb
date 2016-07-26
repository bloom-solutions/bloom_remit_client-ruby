require 'virtus'
require 'httparty'
require 'active_model'
require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/try'
require "bloom_remit_client/version"
require "bloom_remit_client/client"
require "bloom_remit_client/models/biller"
require "bloom_remit_client/requests/base_request"
require "bloom_remit_client/requests/billers_request"
require "bloom_remit_client/responses/base_response"
require "bloom_remit_client/responses/billers_response"

module BloomRemitClient

  def self.new(*args)
    client = Client.new(*args)
    raise ArgumentError, client.errors.full_messages if client.invalid?
    client
  end

end
