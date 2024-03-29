require "graphql/client"
require "graphql/client/http"

module LinkInTheMiddle
  return if LinkInTheMiddle.config.link_graphql_api_endpoint.blank? || LinkInTheMiddle.config.api_token.blank?

  HTTP = GraphQL::Client::HTTP.new(LinkInTheMiddle.config.link_graphql_api_endpoint) do
    def headers(context)
      { 
        "token" => LinkInTheMiddle.config.api_token
      }
    end
  end

  if Rails.env.development?
    # always update schema for dev env
    GraphQL::Client.dump_schema(LinkInTheMiddle::HTTP, "schema.json")
  end

  Schema = GraphQL::Client.load_schema("#{Rails.root}/schema.json")

  Client = GraphQL::Client.new(schema: LinkInTheMiddle::Schema, execute: LinkInTheMiddle::HTTP)
end