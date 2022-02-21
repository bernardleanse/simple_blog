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
end