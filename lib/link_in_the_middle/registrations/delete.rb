require 'link_in_the_middle/api/registrations/delete'

module LinkInTheMiddle
  module Registrations
    class Delete
      def self.perform(record_id: nil)
        result = LinkInTheMiddle::Api::Registrations::Delete.call(
          record_id: record_id,
        )
        result
      end
    end
  end
end
