require 'link_in_the_middle/api/registrations/update'

module LinkInTheMiddle
  module Registrations
    class Update
      def self.perform(record_id: nil, attributes: {})
        result = LinkInTheMiddle::Api::Registrations::Update.call(
          record_id: record_id,
          attributes: attributes,
        )
        result
      end
    end
  end
end
