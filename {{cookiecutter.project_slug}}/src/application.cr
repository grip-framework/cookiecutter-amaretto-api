require "granite/adapter/pg"
require "amaretto"
require "grip"
require "amaretto-grip"
require "crypto/bcrypt/password"

require "./{{cookiecutter.project_slug}}/**"
require "./{{cookiecutter.project_slug}}_web/**"

class Application < Grip::Application
  # The routing and error handling logic is defined here.
  def initialize
    super(environment: ENV["ENVIRONMENT"], serve_static: false)

    forward "/graphql", Amaretto::Grip::GraphQL, query: {{cookiecutter.module_slug}}Web::Schema::Query.new, mutation: {{cookiecutter.module_slug}}Web::Schema::Mutation.new

    if ENV["ENVIRONMENT"] == "development"
      forward "/graphiql", Amaretto::Grip::GraphiQL, url: "/graphql"
    end
  end

  def reuse_port
    true
  end
end
