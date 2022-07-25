require 'link_in_the_middle/users/become'
require 'link_in_the_middle/api/employees/find'

module LinkInTheMiddle
  module Employees
    class Find
      def self.perform(become_user_email: nil, scope: nil, search_params: {})
        if become_user_email
          become_user_token = LinkInTheMiddle::Users::Become.perform(email: become_user_email)
        end

        result = LinkInTheMiddle::Api::Employees::Find.call(
          become_user_token: become_user_token,
          scope: scope,
          search_params: search_params
        )
        result
      end
    end
  end
end