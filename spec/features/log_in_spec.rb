feature 'Log In' do
  scenario 'correctly logs in' do
    User.create(username: 'bernard', password: '123', confirm_password: '123')
    visit '/sessions/new'
    fill_in 'username', with: 'bernard'
    fill_in 'password', with: '123'
    click_button 'Submit'
    expect(page).to have_content "Login Successful!"
    expect(page).to have_content "bernard"
    expect(current_path).to eq '/posts'
  end

  scenario 'posts show username' do
    sign_up_and_log_in
    logged_in_user = DatabaseConnection.query("SELECT * from users WHERE username=$1", ['bernard']).first
    Post.create(content: 'hello', user_id: logged_in_user['id'])
    visit '/posts'
    expect(first('.post')).to have_content 'bernard'
  end
end