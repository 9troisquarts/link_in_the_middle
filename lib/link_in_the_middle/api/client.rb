require "graphql/client"
require "graphql/client/http"

module LinkInTheMiddle
  HTTP = GraphQL::Client::HTTP.new(LinkInTheMiddle.config.link_graphql_api_endpoint) do
    def headers(context)
      { 
        "token" => LinkInTheMiddle.config.api_token
      }
    end
  end

  if LinkInTheMiddle.config.update_schema_on_each_request
    GraphQL::Client.dump_schema(LinkInTheMiddle::HTTP, "schema.json")
  end

  Schema = GraphQL::Client.load_schema("#{Rails.root}/schema.json")

  Client = GraphQL::Client.new(schema: LinkInTheMiddle::Schema, execute: LinkInTheMiddle::HTTP)
end