class ComicsController < ApplicationController
  def index
    @comics = MarvelApi.new(params[:query]).search_results
  end
end
