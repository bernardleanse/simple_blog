feature 'only see edit, delete, and comment if logged in' do
  scenario 'not logged in' do
    user = User.create(username: 'test', password: 'oi', confirm_password: 'oi')
    Post.create(content: 'test post', user_id: user.id)
    # no session yet
    visit '/posts'
    expect(first '.post').not_to have_button 'Edit'
    expect(first '.post').not_to have_button 'Delete'
    expect(first '.post').not_to have_button 'Comment'
  end

  scenario 'tries to bypass edit' do
    sign_up_and_log_in
    post = create_test_post
    click_button 'Log Out'
    visit "posts/#{post['id']}/edit"
    expect(current_path).to eq '/posts'
    expect(page).to have_content "You don't have permission"
  end
end