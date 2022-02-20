feature 'deleting a post' do
  scenario 'user makes a post then deletes it' do
    post = Post.create(content: 'my post')
    visit '/posts'
    expect(page).to have_content 'my post'
    first('.post').click_button('Delete')
    expect(page).not_to have_content 'my post'
  end
end