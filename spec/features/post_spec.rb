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

  pending "User can reply to the post"
    # expect(page).to have_content(new_post_comment_path(post))

  scenario "Unlogged user cannot comments" do
    post = create(:post)
    comment = create(:comment, post_id: post.id)
    visit post_path(post)
    expect(page).to have_link("Reply", href: new_comment_path(post_id: post.id, parent_id: comment))
    click_link("Reply")
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario "Logged User can reply to other comments and will add parent using ancestry gem" do
    post = create(:post)
    comment = create(:comment, post_id: post.id)
    user = create(:user)
    login(user)
    visit post_path(post)
    expect(comment.has_children?).to eq(false)
    expect(page).to have_link("Reply", href: new_comment_path(post_id: post.id, parent_id: comment))
    click_link("Reply")
    expect(page).to have_content(comment.text)
    fill_in "comment_text", with: "Test reply"
    click_button("Submit")
    expect(page).to have_current_path(post_path(post))
    expect(comment.has_children?).to eq(true)
    expect(page).to have_content("Test reply")
    expect(page).to have_css(".nested-comments-container")
  end

  scenario "User can create post" do
    user = create(:user)
    login(user)
    click_link('Submit')
    expect(page).to have_current_path(new_post_path)
    fill_in "post_title", with: "Test title"
    fill_in "post_text", with: "Test text"
    click_button("Submit")
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Your post has been submitted')
    expect(page).to have_link("Test title")

  end

  scenario "Unlogged user cannot reply to posts" do
    post = create(:post)
    comment = create(:comment, post_id: post.id)
    visit post_path(post)
    fill_in "comment_text", with: "Test reply"
    click_button("Submit")
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario "Logged user cannot reply to posts" do
    post = create(:post)
    comment = create(:comment, post_id: post.id)
    user = create(:user)
    login(user)
    visit post_path(post)
    fill_in "comment_text", with: "Test reply"
    click_button("Submit")
    expect(page).to have_current_path(post_path(post))
    expect(page).to have_content("Test reply")

  end

  pending "Test the ranking algorithm"

  pending "Test for showing nested comments"
  pending "View single thread for comments"

  pending "Test for error message while submitting comments"

  pending "Comment vote system test............... Copy from post vote spec"


end
