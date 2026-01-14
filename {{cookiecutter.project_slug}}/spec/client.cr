module GraphQL
  class Client
    def execute(query : String, headers : HTTP::Headers = HTTP::Headers.new) : HTTP::Client::Response
      headers.add("Content-Type", "application/json")

      post {{cookiecutter.module_slug}}::Application.new, "/graphql", headers, {"query" => query}.to_json
    end
  end
end
