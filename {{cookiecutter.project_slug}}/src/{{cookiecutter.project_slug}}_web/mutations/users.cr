module {{cookiecutter.module_slug}}Web
  module Mutations
    module Users
      @[Amaretto::Annotations::Mutation]
      def create_user(context : Context, first_name : String, last_name : String, email : String, password : String) : String
        user = {{cookiecutter.module_slug}}::Accounts::User.new

        user.first_name = first_name
        user.last_name = last_name
        user.email = email
        user.password = password

        # Validate the user; raise Exception if validation fails
        if errors = user.validate
          raise Exception.new(errors)
        end

        # Insert the user into the database
        user.insert

        JWT.encode({"sub" => user.id.to_s}, Constants::SECRET, JWT::Algorithm::HS256)
      end
    end
  end
end
