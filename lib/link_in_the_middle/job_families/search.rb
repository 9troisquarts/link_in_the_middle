require 'link_in_the_middle/api/job_families/search'

module LinkInTheMiddle
  module JobFamilies
    class Search
      def self.perform(search: nil)
        result = LinkInTheMiddle::Api::JobFamilies::Search.call(
          search: search
        )
        result
      end
    end
  end
end