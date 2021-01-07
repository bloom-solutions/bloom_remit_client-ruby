module BloomRemitClient
  class Txn

    include Virtus.model

    attribute :id, String
    attribute :recipient_id, String
    attribute :dest_currency, String
    attribute :receivable_in_dest_currency, BigDecimal
    attribute :payout_method, String
    attribute :status, String
    attribute :account_name, String
    attribute :account_number, String
    attribute :tracking_sender, String
    attribute :tracking_number, String
    attribute :client_external_id, String
    attribute :purpose, String
    attribute :sender_first_name, String
    attribute :sender_last_name, String
    attribute :sender_email, String
    attribute :sender_address, String
    attribute :sender_city, String
    attribute :sender_state, String
    attribute :sender_zip_code, String
    attribute :sender_country, String
    attribute :sender_occupation, String
    attribute :recipient_first_name, String
    attribute :recipient_last_name, String
    attribute :recipient_mobile, String
    attribute :recipient_address, String
    attribute :recipient_city, String
    attribute :recipient_state, String
    attribute :recipient_zip_code, String
    attribute :recipient_country, String
    attribute :recipient_occupation, String
    attribute :recipient_relationship_to_sender, String

  end
end
