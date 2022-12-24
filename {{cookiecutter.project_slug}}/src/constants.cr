module Constants
  # Development environment
  ENVIRONMENT = ENV["ENVIRONMENT"]? || "development"

  # JWT secret
  SECRET = ENV["SECRET"] || UUID.random.to_s

  # Development/Production database URL
  DATABASE_URL = ENV["DATABASE_URL"]

  # Test database URL
  TEST_DATABASE_URL = ENV["TEST_DATABASE_URL"]
end
