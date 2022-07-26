require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module JobFamilies
      JOB_FAMILIES_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        query($search: String) {
          jobFamilies(search: $search) {
            id
            title
          }
        }
      GRAPHQL

      class Search
        def self.call(search: nil)
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::JobFamilies::JOB_FAMILIES_QUERY,
            variables: {
              search: search,
            }
          )
          {
            records: result&.data&.job_families.to_a
          }
        end
      end
    end
  end
end