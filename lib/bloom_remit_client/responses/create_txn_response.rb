module BloomRemitClient
  class CreateTxnResponse

    include APIClientBase::Response.module

    attribute :body, String, lazy: true, default: :default_body
    attribute :parsed_body, String, lazy: true, default: :default_parsed_body
    attribute :txn, Txn, lazy: true, default: :default_txn

    def default_body
      raw_response.body
    end

    def default_parsed_body
      JSON.parse(body).with_indifferent_access
    end

    def default_txn
      Txn.new(parsed_body[:txn])
    end

  end
end
