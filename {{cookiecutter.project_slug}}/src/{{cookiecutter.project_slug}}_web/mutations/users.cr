module {{cookiecutter.module_slug}}Web
  module Mutations
    module Users
      alias Guardian = {{cookiecutter.module_slug}}::Guardian

      @[Amaretto::Annotations::Mutation]
      def create_user(context : Context, first_name : String, last_name : String, email : String, password : String) : String
        user = {{cookiecutter.module_slug}}::Models::User.new(
          first_name: first_name,
          last_name: last_name,
          email: email,
          password: password
        )

        # Validate the user; raise Exception if validation fails
        if errors = user.validate
          raise Exception.new(errors)
        end

        # Insert the user into the database
        user.insert

        Guardian.encode_and_sign(user)
      end
    end
  end
end
