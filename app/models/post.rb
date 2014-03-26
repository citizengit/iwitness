# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  body        :text
#  image       :text
#  rating_up   :integer
#  rating_down :integer
#  user_id     :integer
#  address     :text
#  latitude    :float
#  longitude   :float
#  created_at  :datetime
#  updated_at  :datetime
#

class Post < ActiveRecord::Base
  attr_accessible :title, :body, :image, :rating_up, :rating_down, :user_id, :address, :latitude, :longitude
  belongs_to :user
  

  has_and_belongs_to_many :categories
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  # calculate the posts honesty rating
  def rating_total
    ( self.rating_up.present? ? self.rating_up : 0 ) - ( self.rating_down.present? ? self.rating_down : 0 )
  end

  # calculate the posts honesty rating count
  def rating_count
    ( self.rating_up.present? ? self.rating_up : 0 ) + ( self.rating_down.present? ? self.rating_down : 0 )
  end



    # if @post.rating_up && @post.rating_down
    #   @rating = @post.rating_up - @post.rating_down
    # elsif @post.rating_up && !@post.rating_down
    #   @rating = @post.rating_up
    # elsif !@post.rating_up && @post.rating_down
    #   @rating = @post.rating_down
    # else
    #   @rating = "this post has not been rated"
    # end



end
