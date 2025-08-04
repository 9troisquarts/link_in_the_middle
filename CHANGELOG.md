## [0.19.0] - 2025-01-27
- Topics & sub_topics relation

## [0.18.0] - 2025-01-27
- Add api for training sub topics

## [0.17.0] - 2025-05-23
- Adapt registrations queries and mutations for TIPI app

## [0.16.0] - 2025-05-06
- Add fields to employees list and find

## [0.15.0] - 2025-04-03
- Add evaluation (banding and sub bandings) to employee type

## [0.14.0] - 2025-03-11
- Add Bonus updators to employees

## [0.13.0] - 2025-01-30
- Add training stewards to users

## [0.12.1] - 2024-12-27
- Fix unique_employee_id for upper manager

## [0.12.0] - 2024-12-27
- Added attributes to manager, hr org and upper manager

## [0.11.0] - 2024-03-29
- The schema will not be updated automatically on each request in development env anymore. New config for schema dump: `update_schema_on_each_request`. By default false. Legacy value is `Rails.env.development?`.

## [0.10.1] - 2024-03-29
- Fix in schema loading

## [0.10.0] - 2024-03-29

- Add training session start date and end date

## [0.9.0] - 2024-02-16

- Add api for training topics

## [0.8.0] - 2024-02-15

- Add api for peso bandings

## [0.7.0] - 2023-12-06

- Add csrd_business_unit to legal entities

## [0.6.0] - 2023-11-23

- Add international_job_title for current_assignment

## [0.5.0] - 2023-03-22

- Remove user_token parameter

## [0.4.0] - 2023-02-01

- Add user_token parameter

## [0.3.2] - 2022-11-24

- Add Cb bonus users to employees#find

## [0.3.1] - 2022-11-21

- Fix employees#find when employee is not found

## [0.3.0] - 2022-07-26

- Add search api for job families, business units and legal entities

## [0.2.1] - 2022-07-26

- Fix graphql parameters

## [0.2.0] - 2022-07-25

- Add become user to request on user's visible employees

## [0.1.0] - 2022-07-21

- Initial release
