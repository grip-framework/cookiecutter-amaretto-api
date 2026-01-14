module {{cookiecutter.module_slug}}Web
  module Queries
    module Users
      alias User = {{cookiecutter.module_slug}}Web::Objects::Output::User

      @[Amaretto::Annotations::Query]
      def list_users(context : Context) : Array(User)
        # Check for authorization of the current user
        raise Exception.new("Unauthorized access is prohibited") unless context.get_current_user

        users = {{cookiecutter.module_slug}}::Models::User.all

        users.map do |user|
          User.new(id: user.id.to_s, first_name: user.first_name, last_name: user.last_name, email: user.email)
        end
      end

      @[Amaretto::Annotations::Query]
      def sign_in(context : Context, email : String, password : String) : String
        if user = {{cookiecutter.module_slug}}::Models::User.find_one(email: email)
          return JWT.encode({"sub" => user.id.to_s}, Constants::SECRET, JWT::Algorithm::HS256) \
            if Crypto::Bcrypt::Password.new(user.password).verify(password)
        end

        raise Exception.new("Either the E-Mail or the Password was incorrect.")
      end
    end
  end
end
