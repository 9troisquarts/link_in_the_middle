require 'link_in_the_middle/api/sub_job_families/search'

module LinkInTheMiddle
  module SubJobFamilies
    class Search
      def self.perform(search: nil, job_family_id: nil)
        result = LinkInTheMiddle::Api::SubJobFamilies::Search.call(
          search: search,
          job_family_id: job_family_id
        )
        result
      end
    end
  end
end