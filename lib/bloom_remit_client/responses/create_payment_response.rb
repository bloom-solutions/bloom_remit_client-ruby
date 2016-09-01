module BloomRemitClient
  class CreatePaymentResponse < BaseResponse

    attribute :payment, Object, lazy: true, default: :default_payment

    private

    def default_payment
      Payment.new(body[:payment])
    end

  end
end
