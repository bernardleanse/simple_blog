require 'bcrypt'

class User
  def self.create(username:, password:, confirm_password:)
    return if password != confirm_password
    encrypted_password = BCrypt::Password.create(password)
    user = DatabaseConnection.query(
      "INSERT INTO users(username, password) VALUES($1, $2) RETURNING id, username, password;", [username, encrypted_password]
    ).first
    User.new(id: user['id'], username: user['username'], password: user['password'])
  end

  attr_reader :id, :username, :password

  def initialize(id:, username:, password:)
    @id = id
    @username = username
    @password = password
  end
end