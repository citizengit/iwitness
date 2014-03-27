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
#  imgurl      :text
#

class Post < ActiveRecord::Base
  attr_accessible :title, :body, :image, :imgurl, :rating_up, :rating_down, :user_id, :address, :latitude, :longitude
  belongs_to :user
  has_and_belongs_to_many :categories

  #image uploader
  mount_uploader :image, ImageUploader
  
  #form validation
  validates :title, :presence => true, :length => { :minimum => 4 }
  validates :body, :presence => true, :length => { :minimum => 16 }
  validates :address, :presence => true

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

  def image_object
    self.image.present? ? self.image : self.imgurl
  end

end
