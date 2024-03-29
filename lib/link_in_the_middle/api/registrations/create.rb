require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module Registrations
      CREATE_REGISTRATION_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        mutation($input: CreateRegistrationInput!){
          createCtrRegistration(input: $input) {
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

      class Create
        def self.call(attributes: {})
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::Registrations::CREATE_REGISTRATION_QUERY,
            variables: {
              input: {
                attributes: attributes && attributes.deep_transform_keys! { |key| key.to_s.camelize(:lower) },
              }
            }
          )
      
          # raise if api key is wrong or have not the required access
          raise result.errors.inspect if result.errors.present?

          {
            record: result&.data&.create_ctr_registration&.registration,
            success: result&.data&.create_ctr_registration&.success,
            errors: result&.data&.create_ctr_registration&.errors,
          }
        end
      end
    end
  end
end