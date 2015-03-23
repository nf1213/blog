require "rails_helper"

feature 'User comments' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
    @comment = FactoryGirl.build(:comment, user: @user, post: @post)
    @emoji_comment = FactoryGirl.build(:comment_with_emoji, user: @user, post: @post)
  end

  scenario 'user must be signed in' do
    visit posts_path
    click_link @post.subject
    click_link "Leave a comment"
    expect(page).to have_content "Please sign in to comment."
  end

  scenario 'user provides valid attributes' do
    sign_in(@user)

    visit new_post_comment_path(@post)

    fill_in "Content", with: @comment.content
    click_on "Post Comment"

    expect(page).to have_content "Comment posted."
    expect(page).to have_content @comment.content
  end

  scenario 'user provides invalid attributes' do
    sign_in(@user)

    visit new_post_comment_path(@post)

    fill_in "Content", with: ""
    click_on "Post Comment"

    expect(page).to have_content "Contentcan't be blank"
  end

  scenario 'user makes a comment with emoji' do
    sign_in(@user)

    visit new_post_comment_path(@post)

    fill_in "Content", with: @emoji_comment.content
    click_on "Post Comment"

    expect(page).to have_emoji("sunglasses")
  end
end
