module BloomRemitClient
  class GetDepositTargetsRequest < BaseRequest

    def default_action
      :get
    end

    def path
      "/api/v1/strategies"
    end

  end
end
