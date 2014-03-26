module UsersHelper

  def userhasrating
  # on user pages - defines the postcount message
    if @user.rating.nan? && @user == @current_user
      "You have no current rating - get started by #{ link_to('posting some news', new_post_path)}"
    elsif @user.rating.nan?
      "This user has not yet been rated"
    else
      "User rating #{number_to_percentage(@user.rating*100, precision: 0)} from #{@user.posts.count } #{'post'.pluralize(@user.posts.count)}."
    end
  end

  def userhasposts
  # on user pages - defines whether a YOUR POSTS header should be displayed
    if @user.posts.count > 0
      if @user == @current_user
        "<p class='info centered'>Your Recent Posts</p>"
      else  
        "<p class='info centered'>Recent Posts from #{ @user.name }</p>"
      end
    else
      "<p class='info centered'>No Posts to List</p>"
    end
  end

end
