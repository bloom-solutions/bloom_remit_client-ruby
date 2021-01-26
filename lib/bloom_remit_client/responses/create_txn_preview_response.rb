module BloomRemitClient
  class CreateTxnPreviewResponse < BaseResponse

    attribute :errors, Array, lazy: true, default: :default_errors
    attribute :txn_preview, TxnPreview, lazy: true, default: :default_txn_preview

    def default_errors
      Array(parsed_body[:errors])
    end

    def default_txn_preview
      TxnPreview.new(parsed_body[:txn_preview])
    end

  end
end
