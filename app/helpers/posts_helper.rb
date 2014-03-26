module PostsHelper

  def postuserrating
  # on user pages - defines the postcount message
    if @post.user.rating.nan? && @post.user == @current_user
      "You have no current rating - #{ link_to('post more news to get tongues wagging', new_post_path)}"
    elsif @post.user.rating.nan?
      "This user has not yet been rated"
    else
      "User rating #{number_to_percentage(@post.user.rating*100, precision: 0)} from #{@post.user.posts.count } #{'post'.pluralize(@post.user.posts.count)}."
    end
  end



end
