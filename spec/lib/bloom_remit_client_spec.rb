require "spec_helper"

RSpec.describe BloomRemitClient do

  describe ".configure_message_bus_client_worker!" do
    it "sets a MessageBus subscription" do
      described_class.configure do |c|
        c.partner_id = "5"
        c.api_secret = "sikret"
        c.host = described_class::STAGING
        c.on_txn_update = "Processor"
      end

      described_class.configure_message_bus_client_worker!

      subscriptions = MessageBusClientWorker.configuration.subscriptions
      subscription = subscriptions[described_class::STAGING]
      encoded_string = Base64.strict_encode64("5:sikret")

      aggregate_failures do
        expect(subscription[:headers]["HTTP_AUTHORIZATION"])
          .to eq "Basic #{encoded_string}"
        expect(subscription[:channels][described_class::TXN_UPDATES_CHANNEL]).
          to eq({processor: "Processor"})
      end
    end
  end

end
