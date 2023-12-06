require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module SubJobFamilies
      SUB_JOB_FAMILIES_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        query($search: String, $jobFamilyId: Int) {
          subJobFamilies(search: $search, jobFamilyId: $jobFamilyId) {
            id
            title
            jobFamily {
              id
              title
            }
          }
        }
      GRAPHQL

      class Search
        def self.call(search: nil, job_family_id: nil)
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::SubJobFamilies::SUB_JOB_FAMILIES_QUERY,
            variables: {
              search: search,
              job_family_id: job_family_id
            }
          )
          {
            records: result&.data&.sub_job_families.to_a
          }
        end
      end
    end
  end
end