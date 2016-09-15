module BloomRemitClient
  class Remittance

    include Virtus.model
    attribute :id, String
    attribute :recipient_id, String
    attribute :orig_currency, String
    attribute :dest_currency, String
    attribute :paid_in_orig_currency, Float
    attribute :receivable_in_dest_currency, Float
    attribute :status, String
    attribute :payout_method, String
    attribute :partner_id, String
    attribute :flat_fee_in_orig_currency, Float
    attribute :forex_margin, Float
    attribute :account_name, String
    attribute :account_number, String
    attribute :callback_url, String
    attribute :sender_id, String

  end
end
