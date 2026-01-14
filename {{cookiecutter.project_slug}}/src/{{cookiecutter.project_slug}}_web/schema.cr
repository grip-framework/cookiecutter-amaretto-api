# `{{cookiecutter.module_slug}}Web::Schema` keeps the queries and mutations.
module {{cookiecutter.module_slug}}Web
  class Schema < Amaretto::Schema
    alias Context = Amaretto::Grip::Context

    include Queries::Users
    include Mutations::Users
  end
end
