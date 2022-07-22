require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module Employees
      SEARCH_EMPLOYEES_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        query($search: EmployeesSearchAttributes, $per_page: Int) {
          employeesPaginated(search: $search, perPage: $per_page) {
            employees {
              id
              uniqueEmployeeId
              fullname
              firstname
              lastname
              email
            }
          }
        }
      GRAPHQL

      class Search
        def self.call(search_params: {}, page: nil, per_page: nil, unique_employee_ids: nil)
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::Employees::SEARCH_EMPLOYEES_QUERY,
            variables: {
              search: search_params && search_params.deep_transform_keys! { |key| key.to_s.camelize(:lower) },
              per_page: 10
            }
          )

          {
            records: result&.data&.employees_paginated&.employees.to_a,
          }
        end
      end
    end
  end
end