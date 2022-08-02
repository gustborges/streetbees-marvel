require "application_system_test_case"

class ComicsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_path

    assert_selector ".comic-card", count: 20
  end

  test "displays the right number of results" do
    login_as users(:gustavo)
    visit root_path

    fill_in "Search...", with: "ultimate"

    assert_selector ".comic-card", count: 4
  end
end
