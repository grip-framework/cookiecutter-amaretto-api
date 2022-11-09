module {{cookiecutter.module_slug}}Web
  module Objects
    module Output
      @[Amaretto::Annotations::Output(name: "User")]
      class User < Amaretto::Objects::Output
        include JSON::Serializable

        @[JSON::Field(key: "id")]
        @[Amaretto::Annotations::Field]
        property id : String

        @[JSON::Field(key: "firstName")]
        @[Amaretto::Annotations::Field]
        property first_name : String

        @[JSON::Field(key: "lastName")]
        @[Amaretto::Annotations::Field]
        property last_name : String

        @[JSON::Field(key: "email")]
        @[Amaretto::Annotations::Field]
        property email : String

        def initialize(@id : String, @first_name : String, @last_name : String, @email : String)
        end
      end
    end
  end
end