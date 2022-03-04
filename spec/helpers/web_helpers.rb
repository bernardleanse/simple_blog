def sign_up_and_log_in
  User.create(username: 'baz', password: 'a', confirm_password: 'a')
  visit '/sessions/new'
  fill_in 'username', with: 'baz'
  fill_in 'password', with: 'a'
  click_button
end

def create_test_post
  visit '/posts'
  click_link 'Create A Post'
  fill_in 'post-content', with: 'test'
  click_button 'Submit'
  return DatabaseConnection.query("SELECT * FROM posts WHERE content='test'").first
end