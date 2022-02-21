require 'user'

describe User do
  describe ".create" do
    it 'creates a user, password match' do
      user = User.create(username: 'bernard', password: '123', confirm_password: '123')
      db_data = DatabaseConnection.query("SELECT * FROM users WHERE username=$1;", ['bernard'])

      expect(user).to be_a User
      expect(user.id).to eq db_data.first['id']
      expect(user.username).to eq db_data.first['username']
    end
  
    it 'does not create user if password doesnt match' do
      user = User.create(username: 'bernard', password: '123', confirm_password: '1234')
      expect(user).to eq nil
    end
    
  end
end