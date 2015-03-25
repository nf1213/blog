require "rails_helper"

feature "Nicole deletes a post" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @nicole = FactoryGirl.create(:nicole)
    @post = FactoryGirl.create(:post)
  end

  scenario "must be Nicole" do
    sign_in(@user)

    visit post_path(@post)

    expect(page).to_not have_content "Delete Post"
  end

  scenario "nicole deletes her post successfully" do
    sign_in(@nicole)

    visit post_path(@post)
    click_on "Delete Post"

    expect(page).to have_content "Post deleted"
    expect(page).to_not have_content(@post.subject)
  end
end
