describe {{cookiecutter.module_slug}}Web::Mutations::Users do
  # Truncate the users table to erase entries existing previously.
  setup do
  end

  it "Runs create user mutation" do
    client = GraphQL::Client.new

    query = <<-GraphQL
      mutation{
        createUser(email:"john.doe@email.com", firstName:"John", lastName:"Doe", password:"examplePassword11!") {
          firstName
          lastName
        }
      }
    GraphQL

    response = client.execute_query(query)
    response.status_code.should eq 200

    data = JSON.parse(response.body).["data"].["createUser"]

    first_name = data.["firstName"]
    last_name = data.["lastName"]

    first_name.should eq "John"
    last_name.should eq "Doe"
  end
end
