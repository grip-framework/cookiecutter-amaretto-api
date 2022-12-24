module Amaretto
  module Grip
    class Context
      def get_current_user : {{cookiecutter.module_slug}}::Accounts::User
        _bearer, token = context.get_req_header("Authorization").split(" ")
        payload, _header = JWT.decode(token, Constants::SECRET, JWT::Algorithm::HS256)

        id = payload["sub"]

        if user = {{cookiecutter.module_slug}}::Accounts::User.find(id)
          user
        else
          raise Exception.new("User #{id} was not found.")
        end
      rescue exception
        Log.debug(exception: exception) { exception.message }

        case exception
        when KeyError
          raise Exception.new("An authorization header was not provided.")
        else
          raise Exception.new("Failed to authorize.")
        end
      end
    end
  end
end