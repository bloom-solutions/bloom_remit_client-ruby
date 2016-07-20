module BloomRemitClient
  class BillersResponse

    include Virtus.model
    attribute :raw_response, Object
    attribute :billers, Array, lazy: true, default: :default_billers

    private

    def default_billers
      data.map { |hash| Biller.new(hash) }
    end

    def data
      JSON.parse(raw_response.body)
    end

  end
end
