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
  
    it 'raises exception if password doesnt match' do
      expect{User.create(username: 'bernard', password: '123', confirm_password: '1234')}.to raise_error "Passwords don't match"
    end
  end

  describe ".authenticate" do
    it 'returns user if pw is correct' do
      User.create(username: 'bernard', password: '123', confirm_password: '123')
      user = User.authenticate(username: 'bernard', password: '123')

      expect(user).to be_a User
      expect(user.username).to eq 'bernard'
    end

    it 'returns nil if incorrect' do
      User.create(username: 'bernard', password: '123', confirm_password: '123')
      user = User.authenticate(username: 'bernard', password: '1234')
      expect(user).to eq nil
    end
  end

  describe ".find" do
    it 'returns user if exists' do
      created_user = User.create(username: 'bernard', password: '123', confirm_password: '123')
      user = User.find(id: created_user.id)
      expect(user.username).to eq 'bernard'
    end

    it 'returns nil if no user exists' do
      user = User.find(id: 2)
      expect(user).to eq nil      
    end
  end
end