module LinkInTheMiddle

  class << self
    def configure
      yield config
    end

    def config
      @_config ||= Config.new
    end
  end

  class Config
    attr_accessor :api_token, :link_graphql_api_endpoint

    def initialize
      @api_token = nil
      @link_graphql_api_endpoint = nil
    end
  end
end