require "application_system_test_case"

class RepostsTest < ApplicationSystemTestCase
  setup do
    @repost = reposts(:one)
  end

  test "visiting the index" do
    visit reposts_url
    assert_selector "h1", text: "Reposts"
  end

  test "creating a Repost" do
    visit reposts_url
    click_on "New Repost"

    fill_in "Post", with: @repost.post_id
    fill_in "User", with: @repost.user_id
    click_on "Create Repost"

    assert_text "Repost was successfully created"
    click_on "Back"
  end

  test "updating a Repost" do
    visit reposts_url
    click_on "Edit", match: :first

    fill_in "Post", with: @repost.post_id
    fill_in "User", with: @repost.user_id
    click_on "Update Repost"

    assert_text "Repost was successfully updated"
    click_on "Back"
  end

  test "destroying a Repost" do
    visit reposts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Repost was successfully destroyed"
  end
end
