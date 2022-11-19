module GraphQL
  class Client
    def execute_query(query : String) : HTTP::Client::Response
      headers = HTTP::Headers.new
      headers.add("Content-Type", "application/json")

      post Application.new(environment: Constants::ENVIRONMENT), "/graphql", headers, {"query" => query}.to_json
    end
  end
end
