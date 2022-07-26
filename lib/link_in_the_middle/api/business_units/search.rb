require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module BusinessUnits
      BUSINESS_UNITS_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        query($search: String) {
          businessUnits(search: $search) {
            id
            title
          }
        }
      GRAPHQL

      class Search
        def self.call(search: nil)
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::BusinessUnits::BUSINESS_UNITS_QUERY,
            variables: {
              search: search,
            }
          )
          {
            records: result&.data&.business_units.to_a
          }
        end
      end
    end
  end
end