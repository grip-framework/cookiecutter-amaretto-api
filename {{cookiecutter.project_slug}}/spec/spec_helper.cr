require "spec"
require "spectator"

require "../src/{{cookiecutter.project_slug}}"
require "../src/{{cookiecutter.project_slug}}_web"
require "../src/application"

require "./client"

def setup
  environment = Constants::ENVIRONMENT
  raise Exception.new("Environment variable not set to test, make sure to update environment dependant values as well") unless environment == "test"

  yield
end
