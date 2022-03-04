feature 'check session recognition' do
  it 'recognises login' do
    User.create(username: 'baz', password: 'a', confirm_password: 'a')
    visit '/sessions/new'
    fill_in 'username', with: 'baz'
    fill_in 'password', with: 'a'
    click_button
    expect(page).to have_content 'baz'
  end
end