require 'link_in_the_middle/users/become'
require 'link_in_the_middle/api/employees/search'

module LinkInTheMiddle
  module Employees
    class Search
      def self.perform(become_user_email: nil, scope: nil, search_params: {}, page: nil, per_page: nil, unique_employee_ids: nil)
        if become_user_email
          become_user_token = LinkInTheMiddle::Users::Become.perform(email: become_user_email)
        end

        search_params['leadership_team'] = true if search_params['leadership_team'] == 'true'
        search_params['leadership_team'] = false if search_params['leadership_team'] == 'false'
        search_params['status'] = 'ACTIVE'
        result = LinkInTheMiddle::Api::Employees::Search.call(
          become_user_token: become_user_token,
          scope: scope,
          search_params: search_params,
          unique_employee_ids: unique_employee_ids,
          page: page,
          per_page: per_page
        )
        result
      end
    end
  end
end