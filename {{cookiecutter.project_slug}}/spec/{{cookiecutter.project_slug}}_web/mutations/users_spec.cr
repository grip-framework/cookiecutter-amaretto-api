describe {{cookiecutter.module_slug}}Web::Mutations::Users do
  setup do
    # Truncate the users table to erase entries existing previously.
    {{cookiecutter.module_slug}}::Accounts::User.clear
  end

  it "Runs create user mutation" do
    client = GraphQL::Client.new

    mutation = <<-GraphQL
      mutation{
        createUser(email:"john.doe@email.com", firstName:"John", lastName:"Doe", password:"examplePassword11!")
      }
    GraphQL

    response = client.execute(mutation)

    token = JSON.parse(response.body).["data"].["createUser"].to_s

    token.should start_with "ey"
  end
end
