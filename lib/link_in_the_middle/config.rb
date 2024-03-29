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
    attr_accessor :api_token, :link_graphql_api_endpoint, :update_schema_on_each_request

    def initialize
      @api_token = nil
      @link_graphql_api_endpoint = nil
      @update_schema_on_each_request = false
    end
  end
end