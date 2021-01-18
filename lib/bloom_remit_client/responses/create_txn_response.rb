module BloomRemitClient
  class CreateTxnResponse < BaseResponse

    attribute :txn, Txn, lazy: true, default: :default_txn

    def default_txn
      Txn.new(parsed_body[:txn])
    end

  end
end
