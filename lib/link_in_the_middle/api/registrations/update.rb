require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module Registrations
      UPDATE_REGISTRATION_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        mutation($input: UpdateRegistrationInput!){
          updateCtrRegistration(input: $input) {
            success
            registration {
              id
              ctrRegistrationId
              employeeId
              training
              trainingSession
              trainingSessionStartDate
              trainingSessionEndDate
              status
            }
            errors
          }
        }
      GRAPHQL

      class Update
        def self.call(record_id: nil, attributes: {})
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::Registrations::UPDATE_REGISTRATION_QUERY,
            variables: {
              input: {
                id: record_id,
                attributes: attributes && attributes.deep_transform_keys! { |key| key.to_s.camelize(:lower) },
              }
            }
          )
      
          # raise if api key is wrong or have not the required access
          raise result.errors.inspect if result.errors.present?

          {
            record: result&.data&.update_ctr_registration&.registration,
            success: result&.data&.update_ctr_registration&.success,
            errors: result&.data&.update_ctr_registration&.errors,
          }
        end
      end
    end
  end
end