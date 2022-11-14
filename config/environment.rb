ENV["RACK_ENV"] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV["RACK_ENV"])
require 'active_record'

require_relative '../lib/dog'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "./db/test.sqlite3"
)

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS dogs (
    id INTEGER PRIMARY KEY,
    name TEXT
  )
SQL
ActiveRecord::Base.connection.execute(sql)

# class Dog < ActiveRecord::Base
# end




# # Log SQL output to the terminal
# ActiveRecord::Base.logger = Logger.new(STDOUT)

