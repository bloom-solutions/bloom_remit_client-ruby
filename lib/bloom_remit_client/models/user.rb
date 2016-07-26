module BloomRemitClient
  class User

    include Virtus.model
    attribute :id, String
    attribute :email, String
    attribute :first_name, String
    attribute :last_name, String
    attribute :passport_number, String
    attribute :passport_expiry_date, String
    attribute :tin, String
    attribute :mobile, String
    attribute :address, String
    attribute :city, String
    attribute :state, String
    attribute :zip_code, String
    attribute :country, String
    attribute :birthdate, String

  end
end
