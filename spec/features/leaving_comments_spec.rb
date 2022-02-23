feature 'leaving comments' do
  scenario 'leave comment' do
    allow(:sessions)
    visit '/users/new'
    fill_in 'username', with: 'bernard'
    fill_in 'password', with: 'password'
    fill_in 'confirm-password', with: 'password'
    click_button 'Submit'
    visit '/sessions/new'
    fill_in 'username', with: 'bernard'
    fill_in 'password', with: '123'
    click_button 'Submit'
    post = Post.create(content: 'Hello there')
    puts "the post id is #{post.id}"
    visit '/posts'
    first('.post').click_button 'Comment'
    expect(current_path).to eq "/posts/#{post.id}/comments/new"
    fill_in 'comment-content', with: 'my comment'
    click_button 'Submit'
    expect(first('.post')).to have_content 'my comment'

  end
end