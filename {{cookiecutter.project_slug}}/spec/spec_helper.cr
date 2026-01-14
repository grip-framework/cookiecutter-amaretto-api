require "spec"
require "spectator"

require "../src/{{cookiecutter.project_slug}}"
require "./client"

def setup
  environment = Constants::ENVIRONMENT
  raise Exception.new("Environment variable not set to TEST, make sure to update environment dependant values as well") unless environment == "TEST"

  yield
end
