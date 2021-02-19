# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [0.17.3] - 2021-02-19
### Fixed
- Pass `Authorization` header to BloomRemit

## [0.17.2] - 2021-02-11
### Changed
- Update messagebus channel to `/v2/tx_events` (from `/v2/txns`)

## [0.17.1] - 2021-02-03
### Added
- Add `create_txn#errors` to easily access errors

## [0.17.0] - 2021-02-01
### Added
- `#get_deposit_targets` to list all deposit targets

## [0.16.2] - 2021-01-26
### Changed
- `CreateTxnPreviewResponse#errors` change from `Hash` to `Array`

## [0.16.1] - 2021-01-19
### Changed
- Allow nil for both `partner_id` and `api_secret

## [0.16.0] - 2021-01-18
### Changed
- Removed all API methods (complete overhaul)

### Added
- `#create_txn` to create transactions
- `#create_txn_preview` to determine fees, eta, and max amount of a transaction

## [0.15.0] - 2017-04-26
### Changed
- Production domain is now `www.bloomremit.net`
- Marked `pending` the failing specs:
  - create payment
  - fetch credits

## [0.14.0] - 2016-10-05
### Added
- Factories: `bloom_remit_client_responses_recipients_create`, `bloom_remit_client_responses_recipients_list`

## [0.13.0] - 2016-10-05
### Added
- Add `#recipient_list` to list the recipients of a sender

## [0.12.0] - 2016-10-04
### Added
- Add `#create_txn` that uses a single endpoint to create remittances and payments

### Fixed
- Sender `agent_id` when creating a sender

## [0.11.0] - 2016-09-30
### Added
- Expose `DepositStrategy#country`

## [0.10.0] - 2016-09-30
### Added
- Expose `category` on DepositStrategy
- `#calculate_remittance` to get the remittance fees

## [0.9.0] - 2016-09-16
### Added
- Factory `bloom_remit_client_deposit_strategy`

## [0.8.0] - 2016-09-16
### Added
- Add a way to get the deposit strategies. `slug` and `name` for now

## [0.7.1] - 2016-09-16
### Fixed
- Factory `bloom_remit_client_create_payment_response` renamed to `bloom_remit_client_responses_payments_create`

## [0.7.0] - 2016-09-16
### Changed
- Heavy lifting of sandbox and host defaults fall on BloomRemitClient::Client
- Default sandbox is true. Must set to false to be on production mode

## [0.6.0] - 2016-09-15
### Changed
- Default to staging URL

### Fixed
- Make more threadsafe by passing host into client instantiation

## [0.5.0] - 2016-09-15
### Changed
- Structure of files to more easily add new endpoints

### Added
- `rates` endpoint
- Add method to create remittances

## [0.4.0] - 2016-09-01
### Added
- Made response `#success` a virtus attribute, so that it can be set in factories

## [0.3.1] - 2016-08-06
### Fixed
- Fix syntax issue

## [0.3.0] - 2016-08-06
### Added
- Factories for app development

### Changed
- Use BaseResponse#body to access the `to_hash`ed json response

## [0.2.0] - 2016-07-29
### Added
- Add ability to create sender
- Add ability to create payment

### Changed
- Require `agent_id` to be set on the client

## [0.1.0] - 2016-07-20
### Added
- Fetch billers
