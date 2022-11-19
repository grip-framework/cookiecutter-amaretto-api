module {{cookiecutter.module_slug}}Web
  module Queries
    module Users
      alias User = {{cookiecutter.module_slug}}Web::Objects::Output::User

      @[Amaretto::Annotations::Query]
      def list_users(context : Context) : Array(User)
        users = {{cookiecutter.module_slug}}::Accounts::User.all

        users.map do |user|
          User.new(id: user.id.to_s, first_name: user.first_name, last_name: user.last_name, email: user.email)
        end
      end
    end
  end
end
