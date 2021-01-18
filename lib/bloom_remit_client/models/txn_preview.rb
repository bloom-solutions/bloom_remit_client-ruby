module BloomRemitClient
  class TxnPreview

    include Virtus.model

    attribute :total_fees, BigDecimal
    attribute :maximum_amount, BigDecimal
    attribute :amount, BigDecimal
    attribute :payout_method, String
    attribute :minimum_wait_time_in_minutes, Integer
    attribute :maximum_wait_time_in_minutes, Integer
    attribute :days_available, Array

  end
end
