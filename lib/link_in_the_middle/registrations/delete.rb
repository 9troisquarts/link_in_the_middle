require 'link_in_the_middle/api/registrations/delete'

module LinkInTheMiddle
  module Registrations
    class Delete
      def self.perform(ctr_registration_id: nil, tipi_request_id: nil)
        result = LinkInTheMiddle::Api::Registrations::Delete.call(
          ctr_registration_id: ctr_registration_id,
          tipi_request_id: tipi_request_id,
        )
        result
      end
    end
  end
end
