# BloomRemitClient

Ruby wrapper for BloomRemit's API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bloom_remit_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bloom_remit_client

## Usage

See `spec/functional` for examples.

To subscribe to transaction updates, configure the following (in an initializer if you're using Rails):

```ruby
MessageBusClientWorker.configure do |c|
  c.subscriptions = {
    "https://bloomremit.net" => {
      headers: {
        # TOKEN here is a Base64.strict_encode64 string composed of
        # your PARTNER_ID and API_SECRET joined by a colon character
        "Authorization" => "Basic #{TOKEN}"
      },
      channels: {
        "/v2/txns" => { processor: "ProcessBloomRemitTxnUpdate" },
      }
    },
  }

  # Consider changing MessageBusClientWorker to incrementally add subscriptions
  # and not overwrite like above. Warn if a host is already defined.
  # If we do this, then we can add a helper method to this gem, that adds the sub:
  # BloomRemitClient.configure do |c|
  #   c.partner_id = ENV["BLOOM_REMIT_PARTNER_ID"]
  #   c.api_secret = ENV["BLOOM_REMIT_API_SECRET"]
  #   c.on_txn_update = "ProcessBloomRemitTxnUpdate" # setting this will trigger the MBCW subscription
  # end
  c.subscribe(
    "https://bloomremit.net" => {
      headers: { "Authorization" => "Basic #{TOKEN}" },
      channels: {
        "/v2/txns" => { processor: "ProcessBloomRemitTxnUpdate" },
      }
    },
  )
end
```

```ruby
BloomRemitClient.configure do |c|
  c.partner_id = ENV["BLOOM_REMIT_PARTNER_ID"]
  c.api_secret = ENV["BLOOM_REMIT_API_SECRET"]
  c.on_txn_update = "ProcessBloomRemitTxnUpdate"
end

BloomRemitClient.configure_message_bus_client_worker!
```

Make sure `MessageBusClientWorker` (the gem used underneath this gem) is enqueued at an interval, so your app will continually fetch updates. See [Staying subscribed](https://github.com/bloom-solutions/message_bus_client_worker#staying-subscribed) in MessageBusClientWorker. Note that you will need to have Sidekiq for `MessageBusClientWorker` to function.

Somewhere in your app, define `ProcessBloomRemitTxnUpdates` to update your own database:

```ruby
class ProcessBloomRemitTxnUpdates
  def self.call(remote_txn)
    # remote_txn passed to you is an instance of BloomRemitClient::Txn model
    if withdrawal = Withdrawal.find_by(id: remote_txn.client_external_id)
      withdrawal.update(status: remote_txn.status)
    end
  end
end
```

## Factories

To make testing easier, you may `require 'bloom_remit_client/factories'` in your app.

## Development

- Copy `spec/config.yml.sample` to `spec/config.yml` and put your credentials
- Change stuff
- `rspec`

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/imacchiato/bloom_remit_client-ruby). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
