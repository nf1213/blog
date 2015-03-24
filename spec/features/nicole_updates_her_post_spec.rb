require "rails_helper"

feature "Nicole updates her post" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @nicole = FactoryGirl.create(:nicole)
    @post = FactoryGirl.create(:post)
  end

  scenario "must be nicole" do
    sign_in(@user)

    visit post_path(@post)
    expect(page).to_not have_content "Edit"

    visit edit_post_path(@post)
    expect(page).to have_content "You are not authorized, this is Nicole's Blog!"
  end

  scenario "nicole successfully edits her post" do
    sign_in(@nicole)

    visit post_path(@post)
    click_link "Edit"

    fill_in "Content", with: "Edited"
    click_on "Post!"

    expect(page).to have_content "Post updated"
    expect(page).to have_content "Edited"
  end
end
