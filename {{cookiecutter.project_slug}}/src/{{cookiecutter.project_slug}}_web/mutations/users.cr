module {{cookiecutter.module_slug}}Web
  module Mutations
    module Users
      alias User = {{cookiecutter.module_slug}}Web::Objects::Output::User

      @[Amaretto::Annotations::Mutation]
      def create_user(context : Context, first_name : String, last_name : String, email : String, password : String) : User
        user = {{cookiecutter.module_slug}}::Models::User.new

        user.first_name = first_name
        user.last_name = last_name
        user.email = email
        user.password = password
        user.save!

        User.new(id: user.id.to_s, first_name: first_name, last_name: last_name, email: email)
      end
    end
  end
end