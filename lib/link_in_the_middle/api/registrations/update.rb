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
              tipiTrainingId
              tipiRequestId
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
        def self.call(ctr_registration_id: nil, tipi_request_id: nil, attributes: {})
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::Registrations::UPDATE_REGISTRATION_QUERY,
            variables: {
              input: {
                ctrRegistrationId: ctr_registration_id,
                tipiRequestId: tipi_request_id,
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