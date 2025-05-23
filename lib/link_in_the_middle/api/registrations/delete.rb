require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module Registrations
      DELETE_REGISTRATION_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        mutation($input: DeleteRegistrationInput!){
          deleteCtrRegistration(input: $input) {
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

      class Delete
        def self.call(ctr_registration_id: nil, tipi_request_id: nil)
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::Registrations::DELETE_REGISTRATION_QUERY,
            variables: {
              input: {
                ctrRegistrationId: ctr_registration_id,
                tipiRequestId: tipi_request_id,
              }
            }
          )
      
          # raise if api key is wrong or have not the required access
          raise result.errors.inspect if result.errors.present?

          {
            record: result&.data&.delete_ctr_registration&.registration,
            success: result&.data&.delete_ctr_registration&.success,
            errors: result&.data&.delete_ctr_registration&.errors,
          }
        end
      end
    end
  end
end