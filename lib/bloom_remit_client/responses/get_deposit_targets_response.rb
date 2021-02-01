module BloomRemitClient
  class GetDepositTargetsResponse < BaseResponse

    attribute :deposit_targets, Array, lazy: true, default: :default_deposit_targets

    def default_deposit_targets
      JSON.parse(body).map do |deposit_target_hash|
        hash = deposit_target_hash.with_indifferent_access
        DepositTarget.new(hash)
      end
    end

  end
end
