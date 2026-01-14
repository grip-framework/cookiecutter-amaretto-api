# Environment configuration for {{cookiecutter.module_slug}} API

module Constants
  # Application version
  VERSION = {{cookiecutter.version}}

  # General application settings
  ENVIRONMENT = ENV["ENVIRONMENT"]? || "PRODUCTION" # Set to DEVELOPMENT for local testing
  HOST        = ENV["HOST"]? || "127.0.0.1"         # Bind to all interfaces (useful for local dev)
  PORT        = ENV["PORT"]? || "4004"              # Application port
  REUSE_PORT  = ENV["REUSE_PORT"]? || "true"        # Allow port reuse for faster restarts

  DOMAIN = ENV["DOMAIN"]? || "localhost:4004" # Application domain

  # Security secrets (generate secure values)
  SECRET = ENV["SECRET"]? # JWT or general app secret (generate with `openssl rand -hex 32`)

  # MongoDB configuration
  CONNECTION_URI = ENV["CONNECTION_URI"]? || raise Exception.new("Missing CONNECTION_URI environment variable. Please set it to your MongoDB database connection string (e.g., mongodb://localhost:27017/sanguine_dev)") # MongoDB connection string
  DATABASE       = ENV["DATABASE"]? || raise Exception.new("Missing DATABASE environment variable. Please set it to your MongoDB database name (e.g., database)")
end
