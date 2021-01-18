module BloomRemitClient
  class CreateTxnPreviewRequest < BaseRequest

    attribute :amount, BigDecimal
    attribute :payout_method, String

    def default_action
      :post
    end

    def path
      "/api/v2/txn_previews"
    end

    def body
      txn_preview_values = %i[amount payout_method].each_with_object({}) do |attr, hash|
        hash[attr] = send(attr)
      end

      { txn_preview: txn_preview_values }
    end

  end
end
