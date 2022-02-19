feature "edit posts" do
  scenario "creates a post then edits it" do
    post = Post.create(content: 'my post')
    visit '/posts'
    first('.post').click_button('Edit')
    expect(current_path).to eq "/posts/#{post.id}/edit"
    fill_in 'post-content', with: 'my post edited'
    click_button "Submit"
    expect(page).to have_content 'my post edited'
  end
end