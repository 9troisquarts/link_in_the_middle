require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module Users
      BECOME_USER_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        query($email: String!) {
          becomeUserToken(email: $email)
        }
      GRAPHQL

      class Become
        def self.call(email: nil)
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::Users::BECOME_USER_QUERY,
            variables: {
              email: email
            }
          )
          result&.data&.become_user_token
        end
      end
    end
  end
end