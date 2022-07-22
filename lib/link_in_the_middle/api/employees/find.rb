require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module Employees
      FIND_EMPLOYEE_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        query($search: EmployeesSearchAttributes) {
          employeesPaginated(search: $search) {
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
              currentAssignment {
                jobTitle
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
                  title
                  countryIso
                }
                workingPlaceLegalEntity {
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
                  fullname
                  email
                }
                hrOrg {
                  fullname
                  email
                  currentAssignment {
                    manager {
                      fullname
                    }
                  }
                }
                upperManager {
                  fullname
                  email
                }
              }
            }
          }
        }
      GRAPHQL

      class Find
        def self.call(search_params: {})
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::Employees::FIND_EMPLOYEE_QUERY,
            variables: {
              search: search_params && search_params.deep_transform_keys! { |key| key.to_s.camelize(:lower) },
            }
          )
          {
            record: result&.data&.employees_paginated&.employees.first,
          }
        end
      end
    end
  end
end