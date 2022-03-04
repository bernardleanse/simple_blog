feature 'deleting a post' do
  scenario 'user makes a post then deletes it' do
    sign_up_and_log_in
    create_test_post
    expect(page).to have_content 'test'
    first('.post').click_button('Delete')
    expect(current_path).to eq '/posts'
    expect(page).not_to have_content 'test'
  end
end