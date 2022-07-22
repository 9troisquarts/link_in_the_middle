require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module Users
      FIND_USER_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        query($search: UsersSearchAttributes) {
          users(search: $search) {
            users {
              id
              email
              firstname
              lastname
            }
          }
        }
      GRAPHQL

      class Find
        def self.call(search_params: {})
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::Users::FIND_USER_QUERY,
            variables: {
              search: search_params && search_params.deep_transform_keys! { |key| key.to_s.camelize(:lower) },
            }
          )
          {
            result: result&.data&.users&.users.first,
          }
        end
      end
    end
  end
end