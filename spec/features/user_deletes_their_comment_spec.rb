require "rails_helper"

feature "User deletes their comment" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @other_user = FactoryGirl.create(:other_user)
    @post = FactoryGirl.create(:post)
    @comment = FactoryGirl.create(:comment, post: @post, user: @user)
  end

  scenario "Must be poster of comment" do
    sign_in(@other_user)

    visit post_path(@post)

    expect(page).to_not have_content "Delete Comment"
  end

  scenario "user successfully deletes their comment" do
    sign_in(@user)

    visit post_path(@post)

    click_on "Delete Comment"

    expect(page).to have_content "Comment Deleted"
    expect(page).to_not have_content @comment.content
  end
end
