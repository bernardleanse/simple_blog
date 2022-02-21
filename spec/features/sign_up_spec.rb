feature 'user can sign up' do
  scenario 'user signs up' do
    visit '/users/new' 
    fill_in 'username', with: 'bernardleanse'
    fill_in 'password', with: 'password'
    fill_in 'confirm-password', with: 'password'
    click_button 'Submit'
    expect(page).to have_content 'Registration Successful, You can now login.'
  end

  scenario 'user tries to sign up with already existing username' do 
    User.create(username: 'bernardleanse', password: '123', confirm_password: '123')
    visit '/users/new'
    fill_in 'username', with: 'bernardleanse'
    fill_in 'password', with: 'password'
    fill_in 'confirm-password', with: 'password'
    click_button 'Submit'
    expect(current_path).to eq '/users/new'
    expect(page).to have_content "Someone already has that username, please try another."

  end
end