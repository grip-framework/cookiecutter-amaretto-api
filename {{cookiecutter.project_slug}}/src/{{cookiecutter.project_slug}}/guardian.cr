module {{cookiecutter.module_slug}}
  class Guardian
    Log = ::Log.for(self)

    def self.encode_and_sign(user : Models::User) : String
      # Retrieve the secret from environment variables; raise exception if missing
      secret = ENV["SECRET"]? || raise Exception.new("Missing SECRET environment variable")
      # Encode a JWT for the customer with type, issued-at, expiration, and subject claims
      JWT.encode({"typ" => "User", "iat" => Time.utc.to_unix, "exp" => Time.utc.to_unix + 10800, "sub" => user.id}, secret, JWT::Algorithm::HS512)
    end
  end
end
