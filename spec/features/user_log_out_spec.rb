feature 'log out' do
  scenario 'a logged in user can log out' do
    sign_up_and_log_in
    expect(page).to have_content 'baz'
    click_button 'Log Out'
    expect(page).not_to have_content 'baz'
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'Successfully Logged Out'
  end
end