module BloomRemitClient
  class BaseResponse

    include Virtus.model
    attribute :raw_response, Object

    private

    def data
      json = JSON.parse(raw_response.body)

      if json.is_a?(Array)
        json.map(&:with_indifferent_access)
      else
        json.with_indifferent_access
      end
    end

  end
end
