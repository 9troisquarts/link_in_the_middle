require 'link_in_the_middle/api/registrations/update'

module LinkInTheMiddle
  module Registrations
    class Update
      def self.perform(ctr_registration_id: nil, tipi_request_id: nil, attributes: {})
        result = LinkInTheMiddle::Api::Registrations::Update.call(
          ctr_registration_id: ctr_registration_id,
          tipi_request_id: tipi_request_id,
          attributes: attributes,
        )
        result
      end
    end
  end
end
