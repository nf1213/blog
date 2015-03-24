require "rails_helper"

feature "User edits comment" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @other_user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
    @comment = FactoryGirl.create(:comment, user: @uer, post: @post)
  end

  scenario "User must be the poster of comment" do
    sign_in(@other_user)

    visit post_path(@post)
    expect(page).to_not have_content "Edit Comment"

    visit edit_post_comment_path(@post, @comment)
    expect(page).to have_content "You are not authorized!"
  end

  scenario "User successfully edits their comment" do
    sign_in(@user)

    visit post_path(@post)

    click_on "Edit Comment"

    fill_in "Content", with: "Edited comment"
    click_on "Post Comment"

    expect(page).to have_content "Comment Edited"
    expect(page).to have_content "Edited comment"
  end
end
