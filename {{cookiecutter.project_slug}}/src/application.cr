require "granite/adapter/pg"
require "amaretto"
require "grip"
require "amaretto-grip"
require "crypto/bcrypt/password"
require "micrate"

require "./constants"

require "./extensions/**"

require "./{{cookiecutter.project_slug}}"
require "./{{cookiecutter.project_slug}}_web"

require "./{{cookiecutter.project_slug}}/**"
require "./{{cookiecutter.project_slug}}_web/**"

class Application < Grip::Application
  # The routing and error handling logic is defined here.
  def initialize(environment : String)
    super(environment: environment, serve_static: false)

    # Migrate any pending migrations in case of an error show the status.
    begin
      Micrate::Cli.run_up
    rescue exception
      Micrate::Cli.run_status
    end

    # Enable GraphQL on route /graphql
    forward "/graphql", Amaretto::Grip::GraphQL, query: {{cookiecutter.module_slug}}Web::Schema::Query.new, mutation: {{cookiecutter.module_slug}}Web::Schema::Mutation.new

    if environment == "development"
      # Enable GraphiQL interface to GraphQL
      forward "/graphiql", Amaretto::Grip::GraphiQL, url: "/graphql"

      # Turn on debug mode for development.
      Log.setup(:debug)

      # Insert the log handler to track request/response events.
      router.insert(0, Grip::Handlers::Log.new)
    end
  end

  def reuse_port
    true
  end
end
