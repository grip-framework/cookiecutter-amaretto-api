describe {{cookiecutter.module_slug}}Web::Queries::Users do
  # Truncate the users table to erase entries existing previously.
  setup do
    user = {{cookiecutter.module_slug}}::Models::User.new

    user.first_name = "John"
    user.last_name = "Doe"
    user.email = "john@doe.com"
    user.password = "johnDoe12345678"
    user.save!
  end

  it "Runs create user mutation" do
    client = GraphQL::Client.new

    query = <<-GraphQL
      query{
        listUsers {
          firstName
          lastName
        }
      }
    GraphQL

    response = client.execute_query(query)
    response.status_code.should eq 200

    data = JSON.parse(response.body).["data"].["listUsers"]

    first_name = data.as_a.first.["firstName"]
    last_name = data.as_a.first.["lastName"]

    first_name.should eq "John"
    last_name.should eq "Doe"
  end
end
