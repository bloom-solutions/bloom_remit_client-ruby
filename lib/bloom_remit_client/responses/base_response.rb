module BloomRemitClient
  class BaseResponse

    include Virtus.model
    attribute :raw_response, Object

    private

    def data
      JSON.parse(raw_response.body)
    end

  end
end
