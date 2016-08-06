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

end
