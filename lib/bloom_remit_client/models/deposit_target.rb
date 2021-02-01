module BloomRemitClient
  class DepositTarget

    include Virtus.model

    attribute :slug, String
    attribute :name, String
    attribute :active, Boolean
    attribute :wait_time, String
    attribute :support_line, String
    attribute :sameday_cutoff, Integer
    attribute :maximum, BigDecimal
    attribute :availability, Array
    attribute :availability_daynames, String
    attribute :currencies, Array
    attribute :required_fields, Array
    attribute :type, String
    attribute :iso_code, String
    attribute :data, Hash
    attribute :country, String

  end
end
