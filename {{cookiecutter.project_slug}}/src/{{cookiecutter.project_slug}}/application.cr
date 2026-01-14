require "../{{cookiecutter.project_slug}}_web/**"

class Application
  include Grip::Application

  property handlers : Array(HTTP::Handler) = [
    Grip::Handlers::Log.new,
    Grip::Handlers::Exception.new,
    Grip::Handlers::HTTP.new,
  ] of HTTP::Handler

  property environment : String = Constants::ENVIRONMENT
  property host : String = Constants::HOST
  property port : Int32 = Constants::PORT.to_i
  property? reuse_port : Bool = (Constants::REUSE_PORT || "true") == "true" ? true : false

  # The routing and error handling logic is defined here.
  def initialize
    # Connect to the MongoDB instance
    Moongoon.connect(Constants::CONNECTION_URI, Constants::DATABASE)

    routes
  end

  def routes
    # Enable GraphQL on route /graphql
    forward "/graphql", Amaretto::Grip::GraphQL, query: {{cookiecutter.module_slug}}Web::Schema::Query.new, mutation: {{cookiecutter.module_slug}}Web::Schema::Mutation.new

    if environment == "DEVELOPMENT"
      # Enable GraphiQL interface to GraphQL
      forward "/graphiql", Amaretto::Grip::GraphiQL
    end
  end
end
