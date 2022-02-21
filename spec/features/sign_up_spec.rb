feature 'user can sign up' do
  scenario 'user signs up' do
    visit '/users/new' 
    fill_in 'username', with: 'bernardleanse'
    fill_in 'password', with: 'password'
    fill_in 'confirm-password', with: 'password'
    click_button 'Submit'
    expect(page).to have_content 'Registration Successful, You can now login.'
  end
end