feature "edit posts" do
  scenario "creates a post then edits it" do
    sign_up_and_log_in
    post = create_test_post # create post returns hash relation
    visit '/posts'
    first('.post').click_button('Edit')
    expect(current_path).to eq "/posts/#{post['id']}/edit"
    fill_in 'post-content', with: 'my post edited'
    click_button "Submit"
    expect(page).to have_content 'my post edited'
  end
end