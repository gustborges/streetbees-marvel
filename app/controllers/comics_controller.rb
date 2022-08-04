class ComicsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    search_results = MarvelApi.new(params[:query]).search_results

    sorted_results = search_results.sort_by do |comic|
      Like.where(comic_id: comic.id).count
    end

    @comics = sorted_results.reverse!
  end
end
