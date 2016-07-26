module BloomRemitClient
  class CreateSenderResponse < BaseResponse

    attribute :sender, Object, lazy: true, default: :default_sender

    def success?
      raw_response.success?
    end

    private

    def default_sender
      User.new(data[:sender])
    end

  end
end
