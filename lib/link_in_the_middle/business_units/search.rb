require 'link_in_the_middle/api/business_units/search'

module LinkInTheMiddle
  module BusinessUnits
    class Search
      def self.perform(search: nil)
        result = LinkInTheMiddle::Api::BusinessUnits::Search.call(
          search: search
        )
        result
      end
    end
  end
end