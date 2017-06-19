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
      expect(page).to have_link(post.title, href: post_path(post))
    end

    pending "create link to post"
    pending "create link to user submitter"
    pending "link to comments"

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

  context "Vote system javascript" do

    scenario "The upvote button when clicked change color and will persist after reload page", js: true do
      post = create(:post)
      user = create(:user)
      login(user)
      visit root_path
      expect(page).not_to have_css("i.upvote-clicked")
      # We implement the disable link using changin href:
      # to "javascript: void(0);"
      expect(page).to have_link("", href: upvote_post_path(post))
      visit root_path
      find("a.vote-link-up").trigger('click')
      # Rails cannot find Post.find(1) if not reloaded, not sure why
      post.reload
      expect(page).to have_css("a.upvote-clicked")

      # Reload page and check if the change persist
      page.evaluate_script("window.location.reload()")
      expect(page).to have_css("a.upvote-clicked")
      expect(page).not_to have_link("", href: upvote_post_path(post))
    end

    scenario "The downvote button when clicked change color and will persist after reload page", js: true do
      post = create(:post)
      user = create(:user)
      login(user)
      visit root_path
      expect(page).not_to have_css("i.upvote-clicked")
      # We implement the disable link using changin href:
      # to "javascript: void(0);"
      expect(page).to have_link("", href: downvote_post_path(post))
      visit root_path
      find("a.vote-link-down").trigger('click')
      # Rails cannot find Post.find(1) if not reloaded, not sure why
      post.reload
      expect(page).to have_css("a.downvote-clicked")

      # Reload page and check if the change persist
      page.evaluate_script("window.location.reload()")
      expect(page).to have_css("a.downvote-clicked")
      expect(page).not_to have_link("", href: downvote_post_path(post))
    end

    pending "The vote number increase when the upvote button is clicked"
      # post = create(:post)
      # user = create(:user)
      # login(user)
      # visit root_path
      # find("a.vote-link-up").trigger('click')
      # expect(page).to have_css("#vote-number", text: (post.cached_votes_score + 1))

  end
end
