require 'link_in_the_middle/api/training_topics/search'

module LinkInTheMiddle
  module TrainingTopics
    class Search
      def self.perform(search: nil)
        result = LinkInTheMiddle::Api::TrainingTopics::Search.call(
          search: search
        )
        result
      end
    end
  end
end