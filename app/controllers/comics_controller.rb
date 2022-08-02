class ComicsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @comics = MarvelApi.new(params[:query]).search_results
  end
end
