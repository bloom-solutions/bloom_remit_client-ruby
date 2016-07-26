module BloomRemitClient
  class BaseResponse

    include Virtus.model
    attribute :raw_response, Object

    private

    def data
      JSON.parse(raw_response.body).with_indifferent_access
    end

  end
end
