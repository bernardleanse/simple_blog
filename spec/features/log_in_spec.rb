feature 'Log In' do
  scenario 'correctly logs in' do
    User.create(username: 'bernard', password: '123', confirm_password: '123')
    visit '/sessions/new'
    fill_in 'Username', with: 'bernard'
    fill_in 'Password', with: '123'
    expect(page).to have_content "Successful Login!"
    expect(page).to have_content "bernard"
    expect(current_path).to eq '/posts'
  end
end