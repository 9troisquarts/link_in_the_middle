require 'link_in_the_middle/api/legal_entities/search'

module LinkInTheMiddle
  module LegalEntities
    class Search
      def self.perform(search: nil)
        result = LinkInTheMiddle::Api::LegalEntities::Search.call(
          search: search
        )
        result
      end
    end
  end
end