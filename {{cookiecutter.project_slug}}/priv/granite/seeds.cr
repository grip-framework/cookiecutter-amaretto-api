require "../../src/application"

# Script for populating the database. You can run it as:
#
#     crystal run priv/granite/seeds.cr
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Micrate::Cli.run_up
#
#     user = {{cookiecutter.module_slug}}::Accounts::User.new
#
#     user.first_name = "John"
#     user.last_name = "Doe"
#     user.email = "john@doe.com"
#     user.password = "JohnDoe123"
#
#     user.save!
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.