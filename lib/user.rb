require 'bcrypt'

class User
  def self.create(username:, password:, confirm_password:)
    raise "Passwords don't match" if password != confirm_password
    encrypted_password = BCrypt::Password.create(password)
    user = DatabaseConnection.query(
      "INSERT INTO users(username, password) VALUES($1, $2) RETURNING id, username, password;", [username, encrypted_password]
    ).first
    User.new(id: user['id'], username: user['username'])
  end

  def self.authenticate(username:, password:)
    user = DatabaseConnection.query("SELECT * FROM users WHERE username=$1;", [username]).first
    bcrypt_password = BCrypt::Password.new(user['password'])
    return User.new(id: user['id'], username: user['username']) if bcrypt_password == password
    return nil
  end

  def self.find(id:)
    user = DatabaseConnection.query("SELECT * FROM users WHERE id=$1", [id]).first
    return User.new(id: user['id'], username: user['username']) if user
  end

  attr_reader :id, :username, :password

  def initialize(id:, username:)
    @id = id
    @username = username
  end
end