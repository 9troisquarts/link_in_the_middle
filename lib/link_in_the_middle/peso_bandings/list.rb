require 'link_in_the_middle/api/peso_bandings/list'

module LinkInTheMiddle
  module PesoBandings
    class List
      def self.perform
        LinkInTheMiddle::Api::PesoBandings::List.call
      end
    end
  end
end