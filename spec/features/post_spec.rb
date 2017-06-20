require 'rails_helper'

feature 'Post' do
  scenario "Render the title, the username, and the text" do
    post = create(:post)
    visit post_path(post)
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.user.username)
    expect(page).to have_content(post.text)
  end

  scenario "Render the comments, the submitter, and the date" do
    post = create(:post)
    10.times do
      create(:comment, post_id: post.id)
    end
    visit post_path(post)
    post.comments.each do |comment|
      expect(page).to have_content(comment.text)
      expect(page).to have_content(comment.user.username)
      expect(page).to have_content(time_ago_in_words(comment.created_at))
    end
  end

  pending "Comment vote system test............... Copy from post vote spec"


end
