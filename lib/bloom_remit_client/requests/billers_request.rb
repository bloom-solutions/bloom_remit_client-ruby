module BloomRemitClient
  class BillersRequest < BaseRequest

    PATH = "/api/v2/billers.json"

    def call
      HTTParty.get(self.endpoint)
    end

    private

    def default_path
      PATH
    end

  end
end
