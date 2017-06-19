require 'rails_helper'

feature 'Post' do
  scenario "Render the title, the username, and the text" do
    post = create(:post)
    visit post_path(post)
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.user.username)
    expect(page).to have_content(post.text)
  end
end
