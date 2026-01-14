require "grip"
require "amaretto/grip"
require "moongoon"
require "bson"
require "jwt"

require "crypto/bcrypt"
require "random/secure"

require "./constants"
require "./{{cookiecutter.project_slug}}/**"
require "./extensions/**"

# `{{cookiecutter.module_slug}}` keeps the contexts that define your domain
# and business logic.
#
# Contexts are also responsible for managing your data, regardless
# if it comes from the database, an external API or anything else.
module {{cookiecutter.module_slug}}; end

# Enable debugging if the application is running in a development environment.
Log.setup(:debug) if Constants::ENVIRONMENT == "DEVELOPMENT"

app = {{cookiecutter.module_slug}}::Application.new
app.run
