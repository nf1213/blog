require 'rails_helper'

feature 'Nicole posts' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @nicole = FactoryGirl.create(:nicole)
    @post = FactoryGirl.build(:post)
    @emoji_post = FactoryGirl.build(:post_with_emoji)
  end

  scenario 'must be the owner, Nicole' do
    sign_in(@user)
    expect(page).to_not have_content "New Post"
    visit new_post_path
    expect(page).to have_content "You are not authorized, this is Nicole's Blog!"
  end

  scenario 'nicole provides invalid attributes' do
    sign_in(@nicole)

    click_link "New Post"

    fill_in "Subject", with: ""
    fill_in "Content", with: ""

    click_on "Post!"

    expect(page).to have_content "Subjectcan't be blank"
    expect(page).to have_content "Contentcan't be blank"
  end

  scenario 'nicole posts successfully' do
    sign_in(@nicole)

    visit new_post_path

    fill_in "Subject", with: @post.subject
    fill_in "Content", with: @post.content

    click_on "Post!"

    expect(page).to have_content "You posted!"
    expect(page).to have_content @post.subject
    expect(page).to have_content @post.content
  end

  scenario 'nicole makes a post with emoji' do
    sign_in(@nicole)

    visit new_post_path

    fill_in "Subject", with: @emoji_post.subject
    fill_in "Content", with: @emoji_post.content

    click_on "Post!"

    expect(page).to have_emoji("smile")
    expect(page).to have_emoji("question")
  end

  scenario 'nicole makes a post with an image' do
    sign_in(@nicole)

    visit new_post_path

    fill_in "Subject", with: @post.subject
    fill_in "Content", with: @post.content

    image = "nicole_and_cat.jpg"
    attach_file "Blog image", "./app/assets/images/#{image}"

    click_on "Post!"

    expect(page).to have_image(@post)
  end
end
