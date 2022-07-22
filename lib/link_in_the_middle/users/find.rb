require 'link_in_the_middle/api/users/find'

module LinkInTheMiddle
  module Users
    class Find
      def self.perform(search_params: {})
        result = LinkInTheMiddle::Api::Users::Find.call(
          search_params: search_params
        )
        result
      end
    end
  end
end