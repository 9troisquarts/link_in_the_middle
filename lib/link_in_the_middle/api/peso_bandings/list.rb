require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module PesoBandings
      PESO_BANDINGS_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        query {
          pesoBandings {
            banding
            subBandings
          }
        }
      GRAPHQL

      class List
        def self.call
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::PesoBandings::PESO_BANDINGS_QUERY
          )
          {
            records: result&.data&.peso_bandings.to_a
          }
        end
      end
    end
  end
end