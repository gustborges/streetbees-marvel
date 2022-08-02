require "test_helper"

class MarvelApiTest < ActionController::TestCase
  def setup
    VCR.use_cassette(name: "spider-man") do
      @specific_comics = MarvelApi.new("Ultimate Spider-Man (2000) #69").search_results
      @all_comics = MarvelApi.new("").search_results
    end
  end

  test "it should return a list of 1 comic for Ultimate Spider-Man (2000) #69" do
    assert_equal(1, @specific_comics.length)
  end

  test "it should return a list of 20 comics when there are no queries" do
    assert_equal(20, @all_comics.length)
  end
end
