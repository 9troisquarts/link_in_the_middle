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
        def self.call(record_id: nil)
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::Registrations::DELETE_REGISTRATION_QUERY,
            variables: {
              input: {
                id: record_id,
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