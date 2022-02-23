feature 'log out' do
  xscenario 'a logged in user can log out' do
    User.create(username: 'bernard', password: '123', confirm_password: '123')
    sign_up_and_log_in
    expect(page).to have_content 'bernard'
    click_button 'Log Out'
    expect(page).not_to have_content 'bernard'
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'Successfully Logged Out'
  end
end