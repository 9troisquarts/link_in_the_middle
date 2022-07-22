require 'link_in_the_middle/api/registrations/create'

module LinkInTheMiddle
  module Registrations
    class Create
      def self.perform(attributes: {})
        result = LinkInTheMiddle::Api::Registrations::Create.call(
          attributes: attributes,
        )
        result
      end
    end
  end
end
