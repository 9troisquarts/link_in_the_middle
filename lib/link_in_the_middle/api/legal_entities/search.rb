require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module LegalEntities
      LEGAL_ENTITIES_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        query($search: String) {
          legalEntities(search: $search) {
            id
            title
            csrdBusinessUnit {
              id
              title
            }
          }
        }
      GRAPHQL

      class Search
        def self.call(search: nil)
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::LegalEntities::LEGAL_ENTITIES_QUERY,
            variables: {
              search: search,
            }
          )
          {
            records: result&.data&.legal_entities.to_a
          }
        end
      end
    end
  end
end