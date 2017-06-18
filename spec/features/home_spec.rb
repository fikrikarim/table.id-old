require 'rails_helper'

feature 'home' do
  context "Post" do
    scenario "post title, the index, about time ago, the score vote, and the submitter" do
      post = create(:post)
      visit root_path
      expect(page).to have_content(post.title)
      expect(page).to have_content(time_ago_in_words(post.created_at))
      expect(page).to have_content("1.")
      expect(page).to have_content(post.cached_votes_score)
      expect(page).to have_content(post.user.username)
    end

    pending "create link to post"
    pending "create link to user submitter"
    pending "link to comments"
    pending "amounts of vote post has"

    scenario "unlogged user cannot vote" do
      post = create(:post)
      visit root_path
      expect{click_link("upvote-#{post.id}")
      }.to change{post.reload.cached_votes_score}.by(0)
    end

    scenario "unlogged user when vote will redirect to login page" do
      post = create(:post)
      visit root_path
      click_link("upvote-#{post.id}")
      expect(page).to have_current_path(new_user_session_path)

    end

    scenario "logged user can vote" do
      post = create(:post)
      user = create(:user)
      login(user)
      visit root_path
      expect {
        click_link("upvote-#{post.id}")
      }.to change{post.reload.cached_votes_score}.by(1)
      visit root_path
      expect {
        click_link("downvote-#{post.id}")
      }.to change{post.reload.cached_votes_score}.by(-2)
    end

  end

  context "Vote system" do
    pending "Only logged in user can vote"
    pending "The vote scores increases when upvote clicked"
    pending "The vote scores decreases when downvote clicked"
    pending "Test the ajax using javacript"
  end
end
