# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
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
