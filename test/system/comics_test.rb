require "application_system_test_case"

class ComicsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_path

    assert_selector ".comic-card", minimum: 10
  end

  test "displaying the right number of results on search" do
    login_as users :gustavo
    visit root_path

    fill_in "Search...", with: "ultimate"

    sleep 4

    cards = all ".comic-card", count: 6
    cards.each do |card|
      card.hover
      assert_css card, ".comic-card-title", text: /ultimate/i
    end
  end

  test "liking a comic book" do
    login_as users :gustavo
    visit root_path

    like_btn = find(".comic-like-btn", match: :first)
    like_btn.hover
    assert_css "#heart-off", count: 1

    assert_difference "Like.count", 1 do
      like_btn.hover.find("#heart-off").click
      assert_css "#heart-on", count: 1
    end
  end
end
