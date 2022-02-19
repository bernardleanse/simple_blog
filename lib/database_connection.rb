require 'pg'

class DatabaseConnection
  def self.connect(db)
    @connection = PG.connect(dbname: db)
  end
end