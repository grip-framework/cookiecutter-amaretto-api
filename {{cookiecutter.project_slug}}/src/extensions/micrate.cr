module Micrate
  module DB
    # Connection URL is based on the environment, in case of test use the testing database.
    @@connection_url = Constants::ENVIRONMENT == "test" ? Constants::TEST_DATABASE_URL : Constants::DATABASE_URL
  end

  def self.db_dir
    "priv/granite"
  end

  def self.migrations_dir
    File.join(db_dir, "migrations")
  end
end
