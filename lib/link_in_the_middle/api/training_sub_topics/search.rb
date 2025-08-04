require 'link_in_the_middle/api/client'

module LinkInTheMiddle
  module Api
    module TrainingSubTopics
      TRAINING_SUB_TOPICS_QUERY = LinkInTheMiddle::Client.parse <<-'GRAPHQL'
        query($search: String, $trainingTopicId: Int) {
          trainingSubTopics(search: $search, trainingTopicId: $trainingTopicId) {
            id
            title
            trainingTopic {
              id
              title
            }
          }
        }
      GRAPHQL

      class Search
        def self.call(search: nil, training_topic_id: nil)
          result = LinkInTheMiddle::Client.query(
            LinkInTheMiddle::Api::TrainingSubTopics::TRAINING_SUB_TOPICS_QUERY,
            variables: {
              search: search,
              training_topic_id: training_topic_id
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