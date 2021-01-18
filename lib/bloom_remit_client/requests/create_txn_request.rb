module BloomRemitClient
  class CreateTxnRequest < BaseRequest

    attribute :sender_first_name, String
    attribute :sender_last_name, String
    attribute :sender_email, String
    attribute :sender_mobile, String
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
    attribute :dest_currency, String
    attribute :receivable_in_dest_currency, String
    attribute :payout_method, String
    attribute :purpose, String
    attribute :account_number, String
    attribute :account_name, String
    attribute :client_external_id, String

    BODY_ATTRIBUTES = %i[
      sender_first_name
      sender_last_name
      sender_email
      sender_mobile
      sender_address
      sender_city
      sender_state
      sender_zip_code
      sender_country
      sender_occupation
      recipient_first_name
      recipient_last_name
      recipient_mobile
      recipient_address
      recipient_city
      recipient_state
      recipient_zip_code
      recipient_country
      recipient_occupation
      recipient_relationship_to_sender
      dest_currency
      receivable_in_dest_currency
      payout_method
      purpose
      account_number
      account_name
      client_external_id
    ].freeze

    def default_action
      :post
    end

    def path
      "/api/v2/txns"
    end

    def body
      txn_values = BODY_ATTRIBUTES.each_with_object({}) do |attr, hash|
        hash[attr] = send(attr)
      end

      { txn: txn_values }
    end

  end
end
