class LikesController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @like = Like.find_by(like_params)

    if @like
      @like.destroy
    else
      @like = Like.new(like_params)
      @like.save
    end
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
  end

  private

  def like_params
    params.require(:like).permit(:comic_id, :user_id)
  end
end
