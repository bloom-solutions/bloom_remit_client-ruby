module BloomRemitClient
  class BillersResponse < BaseResponse

    attribute :billers, Array, lazy: true, default: :default_billers

    private

    def default_billers
      data.map { |hash| Biller.new(hash) }
    end

  end
end
