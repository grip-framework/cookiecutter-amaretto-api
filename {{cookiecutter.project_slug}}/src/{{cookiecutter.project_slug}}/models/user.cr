module {{cookiecutter.module_slug}}
  module Models
    class User < Moongoon::Collection
      collection "users"

      # Indexes
      index keys: {email: 1}, options: {unique: true}
      index keys: {phone_number: 1}, options: {unique: true, sparse: true}
      index keys: {created_at: 1}

      # Required fields for user identification
      property first_name : String
      property last_name : String
      property email : String
      # Hashed password using BCrypt
      property password : String
      # Profile photo URL
      property profile_photo : String?

      # Timestamps
      property created_at : Time = Time.utc
      property updated_at : Time = Time.utc

      def validate : String?
        errors = [] of String

        errors << "firstName is required and must not be empty" if first_name.empty?
        errors << "lastName is required and must not be empty" if last_name.empty?
        errors << "email must not be empty if provided" if email.empty?
        errors << "password is required and must not be empty" if password.empty?

        errors.empty? ? nil : errors.join(", ")
      end

      def self.new(
        first_name : String,
        last_name : String,
        email : String,
        password : String,
        profile_photo : String? = nil,
        created_at : Time = Time.utc,
        updated_at : Time = Time.utc,
      )
        hashed_password = Crypto::Bcrypt::Password.create(password, cost: 12).to_s

        new(
          _id: BSON::ObjectId.new,
          first_name: first_name,
          last_name: last_name,
          email: email,
          password: hashed_password,
          phone_number: phone_number,
          profile_photo: profile_photo,
          created_at: created_at,
          updated_at: updated_at
        )
      end

      def verify_password(plaintext : String) : Bool
        Crypto::Bcrypt::Password.new(password).verify(plaintext)
      end

      def update_password(plaintext : String)
        self.password = Crypto::Bcrypt::Password.create(plaintext, cost: 12).to_s
      end

      def before_update
        self.updated_at = Time.utc
      end

      def to_json(json : JSON::Builder)
        json.object do
          json.field "id", id.to_s
          json.field "firstName", first_name
          json.field "lastName", last_name
          json.field "email", email
          json.field "phoneNumber", phone_number
          json.field "profilePhoto", profile_photo
          json.field "createdAt", created_at.to_utc.to_rfc3339
          json.field "updatedAt", updated_at.to_utc.to_rfc3339
        end
      end
    end
  end
end
