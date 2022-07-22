require 'link_in_the_middle/api/employees/find'

module LinkInTheMiddle
  module Employees
    class Find
      def self.perform(search_params: {})
        result = LinkInTheMiddle::Api::Employees::Find.call(
          search_params: search_params
        )
        result
      end
    end
  end
end