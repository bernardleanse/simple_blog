require 'pg'

class DatabaseConnection
  def self.connect(db)
    @connection = PG.connect(dbname: db)
  end

  def self.query(sql, params = [])
    @connection.exec_params(sql, params)
  end
end