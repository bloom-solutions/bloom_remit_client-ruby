module BloomRemitClient
  class Biller

    include Virtus.model
    attribute :slug, String
    attribute :description, String
    attribute :first_field, String
    attribute :first_field_format, String
    attribute :first_field_width, Integer
    attribute :second_field, String
    attribute :second_field_format, String
    attribute :second_field_width, Integer
    attribute :service_charge, Float

  end
end
