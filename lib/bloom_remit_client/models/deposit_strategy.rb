module BloomRemitClient
  class DepositStrategy

    include Virtus.model
    attribute :slug, String
    attribute :name, String
    attribute :category, String

  end
end
