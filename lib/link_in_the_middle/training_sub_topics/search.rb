require 'link_in_the_middle/api/training_sub_topics/search'

module LinkInTheMiddle
  module TrainingSubTopics
    class Search
      def self.perform(search: nil, training_topic_id: nil)
        result = LinkInTheMiddle::Api::TrainingSubTopics::Search.call(
          search: search,
          training_topic_id: training_topic_id
        )
        result
      end
    end
  end
end 