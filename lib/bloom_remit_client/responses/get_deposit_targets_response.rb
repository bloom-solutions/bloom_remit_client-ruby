module BloomRemitClient
  class GetDepositTargetsResponse < BaseResponse

    def default_parsed_body
      JSON.parse(body).map do |deposit_target_hash|
        hash = deposit_target_hash.with_indifferent_access
        DepositTarget.new(hash)
      end
    end

  end
end
