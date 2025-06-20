require 'link_in_the_middle/api/training_sub_topics/search'

module LinkInTheMiddle
  module TrainingSubTopics
    class Search
      def self.perform(search: nil)
        result = LinkInTheMiddle::Api::TrainingSubTopics::Search.call(
          search: search
        )
        result
      end
    end
  end
end 