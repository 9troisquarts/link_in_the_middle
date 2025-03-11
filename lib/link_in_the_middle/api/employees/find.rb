require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module Employees
      FIND_EMPLOYEE_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        query($become_user_token: String, $scope: String, $search: EmployeesSearchAttributes) {
          employeesPaginated(becomeUserToken: $become_user_token, scope: $scope, search: $search) {
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
              teamSize
              birthdate
              cbBonusUsers {
                fullname
                email
              }
              cbBonusUpdators {
                fullname
                email
              }
              currentAssignment {
                jobTitle
                internationalJobTitle
                startDate
                endDate
                internationalStatus
                leadershipTeam
                jobFamily {
                  title
                }
                subJobFamily {
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
                  title
                }
                contractType {
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
                  uniqueEmployeeId
                  firstname
                  lastname
                  fullname
                  email
                }
              }
            }
          }
        }
      GRAPHQL

      class Find
        def self.call(become_user_token: nil, scope: nil, search_params: {})
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::Employees::FIND_EMPLOYEE_QUERY,
            variables: {
              become_user_token: become_user_token,
              scope: scope,
              search: search_params && search_params.deep_transform_keys! { |key| key.to_s.camelize(:lower) },
            }
          )
          {
            record: result&.data&.employees_paginated&.employees&.first,
          }
        end
      end
    end
  end
end