require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module Employees
      EMPLOYEES_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        query($become_user_token: String, $scope: String, $search: EmployeesSearchAttributes, $unique_employee_ids: [String!], $page: Int, $per_page: Int) {
          employeesPaginated(becomeUserToken: $become_user_token, scope: $scope, search: $search, uniqueEmployeeIds: $unique_employee_ids, page: $page, perPage: $per_page) {
            employees {
              id
              uniqueEmployeeId
              firstname
              lastname
              isManager
              isHrOrg
              email
              nationalityIso
              arrivalOn
              url
              gender
              birthdate
              cbBonusUsers {
                fullname
                email
              }
              cbBonusUpdators {
                fullname
                email
              }
              evaluation {
                banding
                subBanding
              }
              currentAssignment {
                jobTitle
                internationalJobTitle
                startDate
                endDate
                internationalStatus
                leadershipTeam
                jobFamily {
                  id
                  title
                }
                subJobFamily {
                  id
                  title
                }
                contractLegalEntity {
                  id
                  title
                  countryIso
                }
                workingPlaceLegalEntity {
                  id
                  title
                  countryIso
                }
                businessUnit {
                  id
                  title
                }
                contractType {
                  id
                  title
                }
                manager {
                  id
                  uniqueEmployeeId
                  firstname
                  lastname
                  fullname
                  email
                }
                hrOrg {
                  id
                  uniqueEmployeeId
                  firstname
                  lastname
                  fullname
                  email
                  currentAssignment {
                    manager {
                      fullname
                    }
                  }
                }
                upperManager {
                  id
                  uniqueEmployeeId
                  firstname
                  lastname
                  fullname
                  email
                }
              }            
            }
            pagination {
              page
              perPage
              total
              totalPage
            }
          }
        }
      GRAPHQL

      class List
        def self.call(become_user_token: nil, scope: nil, search_params: {}, page: nil, per_page: nil, unique_employee_ids: nil)
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::Employees::EMPLOYEES_QUERY,
            variables: {
              become_user_token: become_user_token,
              scope: scope,
              search: search_params && search_params.deep_transform_keys! { |key| key.camelize(:lower) },
              unique_employee_ids: unique_employee_ids,
              page: page,
              per_page: per_page
            }
          )
          {
            records: result&.data&.employees_paginated&.employees.to_a,
            pagination: result&.data&.employees_paginated&.pagination
          }
        end
      end
    end
  end
end