feature 'creating posts' do
  scenario 'user can enter post and view it' do
    visit('/posts/new')
    fill_in 'post-content', with: "test post!"
    click_button "Submit"
    expect(current_path).to eq '/posts'
    expect(page).to have_content "test post!"
  end
end
