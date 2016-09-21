module BloomRemitClient
  module Responses
    module Remittances
      class Calculate < Base

        attribute(:origin_amount, Float, {
          lazy: true,
          default: :default_origin_amount,
        })
        attribute(:origin_currency, String, {
          lazy: true,
          default: :default_origin_currency,
        })
        attribute(:destination_amount, Float, {
          lazy: true,
          default: :default_destination_amount,
        })
        attribute(:destination_currency, String, {
          lazy: true,
          default: :default_destination_currency,
        })
        attribute(:flat_fee_in_orig_currency, Float, {
          lazy: true,
          default: :default_flat_fee_in_orig_currency,
        })
        attribute(:forex_fee_in_orig_currency, Float, {
          lazy: true,
          default: :default_forex_fee_in_orig_currency,
        })
        attribute(:payout_fee_in_orig_currency, Float, {
          lazy: true,
          default: :default_payout_fee_in_orig_currency,
        })
        attribute(:flat_fee_in_dest_currency, Float, {
          lazy: true,
          default: :default_flat_fee_in_dest_currency,
        })
        attribute(:payout_fee_in_dest_currency, Float, {
          lazy: true,
          default: :default_payout_fee_in_dest_currency,
        })
        attribute(:forex_fee_in_dest_currency, Float, {
          lazy: true,
          default: :default_forex_fee_in_dest_currency,
        })

        private

        %i[
          origin_amount
          origin_currency
          destination_amount
          destination_currency
          flat_fee_in_orig_currency
          forex_fee_in_orig_currency
          payout_fee_in_orig_currency
          flat_fee_in_dest_currency
          payout_fee_in_dest_currency
          forex_fee_in_dest_currency
        ].each do |var|
          define_method :"default_#{var}" do
            body[:response][var]
          end
        end

      end
    end
  end
end
