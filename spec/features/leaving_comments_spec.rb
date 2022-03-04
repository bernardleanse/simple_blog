feature 'leaving comments' do
  scenario 'leave comment' do
    sign_up_and_log_in
    post = create_test_post
    visit '/posts'
    first('.post').click_button 'Comment'
    expect(current_path).to eq "/posts/#{post['id']}/comments/new"
    fill_in 'comment-content', with: 'my comment'
    click_button 'Submit'
    expect(first('.post')).to have_content 'my comment'

  end
end