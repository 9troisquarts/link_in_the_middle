require 'link_in_the_middle/api/employees/search'

module LinkInTheMiddle
  module Employees
    class Search
      def self.perform(search_params: {}, page: nil, per_page: nil, unique_employee_ids: nil)
        search_params['leadership_team'] = true if search_params['leadership_team'] == 'true'
        search_params['leadership_team'] = false if search_params['leadership_team'] == 'false'
        # search_params['status'] = 'ACTIVE'
        result = LinkInTheMiddle::Api::Employees::Search.call(
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