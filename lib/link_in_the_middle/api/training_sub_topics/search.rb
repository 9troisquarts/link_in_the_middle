require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module TrainingSubTopics
      TRAINING_SUB_TOPICS_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        query($search: String) {
          trainingSubTopics(search: $search) {
            id
            title
          }
        }
      GRAPHQL

      class Search
        def self.call(search: nil)
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::TrainingSubTopics::TRAINING_SUB_TOPICS_QUERY,
            variables: {
              search: search,
            }
          )
          {
            records: result&.data&.training_sub_topics.to_a
          }
        end
      end
    end
  end
end 