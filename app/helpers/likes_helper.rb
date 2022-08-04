module LikesHelper
  def heart_icon(comic_id)
    Like.find_by(user: current_user, comic_id: comic_id) ? "on" : "off"
  end
end
