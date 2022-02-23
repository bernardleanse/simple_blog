def sign_up_and_log_in
  visit '/users/new'
  fill_in 'username', with: 'bernard'
  fill_in 'password', with: 'password'
  fill_in 'confirm-password', with: 'password'
  click_button 'Submit'
  click_button 'Log In'
  fill_in 'username', with: 'bernard'
  fill_in 'password', with: '123'
  click_button 'Submit'
end