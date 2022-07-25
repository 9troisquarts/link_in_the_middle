require 'link_in_the_middle/api/users/become'

module LinkInTheMiddle
  module Users
    class Become
      def self.perform(email: nil)
        result = LinkInTheMiddle::Api::Users::Become.call(
          email: email
        )
        result
      end
    end
  end
end