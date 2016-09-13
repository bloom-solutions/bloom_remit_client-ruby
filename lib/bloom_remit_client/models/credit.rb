# frozen_string_literal: true
module BloomRemitClient
  class Credit
    PATH = '/api/v1/partners/:api_token/credits'
    include Virtus.model
    include ActiveModel::Validations

    def call
      to_h
    end
  end
end
