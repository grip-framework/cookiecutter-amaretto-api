EMAIL    = "john@doe.com"
PASSWORD = "johnDoe12345678"

describe {{cookiecutter.module_slug}}Web::Queries::Users do
  it "Runs list users query" do
    setup do
      # Truncate the users table to erase entries existing previously.
      {{cookiecutter.module_slug}}::Models::User.clear

      user = {{cookiecutter.module_slug}}::Models::User.new

      user.first_name = "John"
      user.last_name = "Doe"
      user.email = EMAIL
      user.password = PASSWORD
      user.insert
    end

    client = GraphQL::Client.new

    query = <<-GraphQL
      query{
        signIn(email:"#{EMAIL}", password:"#{PASSWORD}")
      }
    GraphQL

    response = client.execute(query)
    token = JSON.parse(response.body).["data"].["signIn"].to_s

    headers = HTTP::Headers.new

    headers.add("Authorization", "Bearer #{token}")

    query = <<-GraphQL
      query{
        listUsers {
          firstName
          lastName
        }
      }
    GraphQL

    response = client.execute(query, headers)

    users = JSON.parse(response.body).["data"].["listUsers"].as_a

    first_name = users.first.["firstName"]
    last_name = users.first.["lastName"]

    first_name.should eq "John"
    last_name.should eq "Doe"
  end

  it "Runs sign in query" do
    setup do
      # Truncate the users table to erase entries existing previously.
      {{cookiecutter.module_slug}}::Models::User.clear

      user = {{cookiecutter.module_slug}}::Models::User.new

      user.first_name = "John"
      user.last_name = "Doe"
      user.email = EMAIL
      user.password = PASSWORD
      user.insert
    end

    client = GraphQL::Client.new

    query = <<-GraphQL
      query{
        signIn(email:"#{EMAIL}", password:"#{PASSWORD}")
      }
    GraphQL

    response = client.execute(query)
    token = JSON.parse(response.body).["data"].["signIn"].to_s

    token.should start_with "ey"
  end
end
