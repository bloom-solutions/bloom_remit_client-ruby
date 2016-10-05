require 'spec_helper'

module BloomRemitClient
  module Responses
    module Recipients
      RSpec.describe List do

        describe "#recipients" do
          let(:body) do
            [
              {
                "id"=>"88c46a5e-e3c1-407f-a09a-460ef4c4864f",
                "first_name"=>"Jack John",
                "last_name"=>"S. Ong",
                "email"=>"jackjohnsong@gmail.com",
                "mobile"=>"+6398199818181",
                "created_at"=>"2016-10-05T10:42:36.461+08:00",
                "state"=>"Metro Manila",
                "country"=>"PH",
              }
            ]
          end
          let(:response) { described_class.new(body: body) }
          let(:recipients) { response.recipients }

          it "instantiates the recipients with Recipient objects" do
            expect(recipients).to_not be_empty
            recipient = recipients.first
            expect(recipient.id).to eq "88c46a5e-e3c1-407f-a09a-460ef4c4864f"
            expect(recipient.first_name).to eq "Jack John"
            expect(recipient.last_name).to eq "S. Ong"
            expect(recipient.email).to eq "jackjohnsong@gmail.com"
            expect(recipient.mobile).to eq "+6398199818181"
            expect(recipient.created_at).to eq Time.parse("2016-10-05T10:42:36.461+08:00")
            expect(recipient.state).to eq "Metro Manila"
            expect(recipient.country).to eq "PH"
          end
        end

      end
    end
  end
end
