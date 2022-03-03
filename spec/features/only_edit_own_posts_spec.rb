feature 'only edit own posts' do
  scenario 'not logged in, tries to edit post' do
    user = User.create(username: 'test', password: 'oi', confirm_password: 'oi')
    Post.create(content: 'test post', user_id: user.id)
    
  end
end