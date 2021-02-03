module BloomRemitClient
  class CreateTxnResponse < BaseResponse

    attribute :errors, Array, lazy: true, default: :default_errors
    attribute :txn, Txn, lazy: true, default: :default_txn

    def default_errors
      Array(parsed_body[:errors])
    end

    def default_txn
      Txn.new(parsed_body[:txn])
    end

  end
end
