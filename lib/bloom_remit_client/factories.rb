FactoryGirl.define do

  factory :bloom_remit_client_biller, class: "BloomRemitClient::Biller" do
    sequence(:slug) {|n| "biller_#{n}" }
    first_field "Account No."
    first_field_format "Alphanumeric"
    first_field_width 30
    second_field "Account Name"
    second_field_format "Alphanumeric"
    second_field_width 50
  end

  factory(:bloom_remit_client_deposit_strategy, {
    class: "BloomRemitClient::DepositStrategy",
  }) do
    sequence(:slug) {|n| "deposit_strategy_#{n}" }
    name "Deposit Strategy"
    category "bank"
  end

  factory(:bloom_remit_client_responses_payments_create, {
    class: "BloomRemitClient::Responses::Payments::Create",
  }) do
    success true
    body { {"json" => "value"} }
  end

  factory(:bloom_remit_client_responses_recipients_create, {
    class: "BloomRemitClient::Responses::Recipients::Create",
  }) do
    success true
    body { {"json" => "value"} }
  end

  factory(:bloom_remit_client_responses_recipients_list, {
    class: "BloomRemitClient::Responses::Recipients::List",
  }) do
    success true
    recipients do
      [
        build(:bloom_remit_client_recipient),
        build(:bloom_remit_client_recipient),
      ]
    end
  end

  factory :bloom_remit_client_recipient, class: "BloomRemitClient::Recipient" do
    id { SecureRandom.uuid }
  end

end
