require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module TrainingTopics
      TRAINING_TOPICS_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        query($search: String) {
          trainingTopics(search: $search) {
            id
            title
            subTopics {
              id
              title
            }
          }
        }
      GRAPHQL

      class Search
        def self.call(search: nil)
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::TrainingTopics::TRAINING_TOPICS_QUERY,
            variables: {
              search: search,
            }
          )
          {
            records: result&.data&.training_topics.to_a
          }
        end
      end
    end
  end
end