feature 'deleting a post' do
  scenario 'user makes a post then deletes it' do
    post = Post.create(content: 'my post')
    allow(:session).to receiv
    visit '/posts'
    expect(page).to have_content 'my post'
    first('.post').click_button('Delete')
    expect(current_path).to eq '/posts'
    expect(page).not_to have_content 'my post'
  end
end