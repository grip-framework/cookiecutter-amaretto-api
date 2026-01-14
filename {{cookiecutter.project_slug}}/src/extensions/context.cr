module Amaretto
  module Grip
    class Context
      def get_current_user : {{cookiecutter.module_slug}}::Accounts::User
        # Extract the Authorization header; raise Exception if missing
        header = context.get_req_header?("Authorization")
        raise Exception.new("Please provide a JWT authorization token in the header") unless header

        # Retrieve the secret from environment variables; raise exception if missing
        secret = Constants::SECRET || raise Exception.new("Missing SECRET environment variable")

        begin
          # Decode the JWT token using the secret and HS512 algorithm
          payload, _header = JWT.decode(header.split.last, secret, JWT::Algorithm::HS512)
        rescue exception
          # Raise Exception if the token signature is invalid
          raise Exception.new("Invalid authorization token signature")
        end

        # Extract the type and subject from the JWT payload
        sub = payload.["sub"].as_s

        # Validate the subject is a valid BSON ObjectId; raise Exception if invalid
        raise Exception.new("Invalid authorization token subject") unless BSON::ObjectId.validate(sub)

        if user = {{cookiecutter.module_slug}}::Models::User.find_by_id(id)
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
