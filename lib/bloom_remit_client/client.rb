# frozen_string_literal: true
module BloomRemitClient
  class Client
    include APIClientBase::Client.module(default_opts: :default_opts)

    attribute :partner_id, String
    attribute :api_secret, String
    attribute :host, String, lazy: true, default: :default_host

    api_action :create_txn
    api_action :create_txn_preview

    def default_opts
      { host: host, partner_id: partner_id, api_secret: api_secret }
    end

  end
end
