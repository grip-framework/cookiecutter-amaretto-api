module {{cookiecutter.module_slug}}
  module Models
    class User < Granite::Base
      Granite::Connections << Granite::Adapter::Pg.new(name: "postgres", url: Constants::DATABASE_URL)

      connection postgres
      table users

      column id : UUID, converter: Granite::Converters::Uuid(String) , primary: true, auto: false

      column email : String
      column password : String

      column first_name : String
      column last_name : String

      validate_not_blank :email
      validate_not_blank :password
      validate_not_blank :first_name
      validate_not_blank :last_name
      validate_uniqueness :email

      before_create :assign_id
      before_save :hash_password

      def hash_password : Nil
        if password = @password
          @password = Crypto::Bcrypt::Password.create(password).to_s
        end
      end

      def assign_id
        @id = UUID.random
      end
    end
  end
end