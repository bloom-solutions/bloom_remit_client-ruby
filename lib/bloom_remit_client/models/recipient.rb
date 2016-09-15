module BloomRemitClient
  class Recipient

    include Virtus.model
    attribute :id, String
    attribute :first_name, String
    attribute :last_name, String
    attribute :mobile, String
    attribute :email, String
    attribute :address, String
    attribute :city, String
    attribute :state, String
    attribute :country, String
    attribute :postal_code, String

  end
end
