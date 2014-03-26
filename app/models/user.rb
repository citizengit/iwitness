# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :text
#  image           :text
#  address         :text
#  latitude        :float
#  longitude       :float
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :image, :address, :latitude, :longitude, :password, :password_confirmation
  has_many :posts
  
  #form validation
  validates :name, :presence => true, :uniqueness => true
  validates :email, :presence => true
  validates :image, :presence => true, :length => { :minimum => 2 }
  validates :password, length: { minimum: 6 }
  has_secure_password
  
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  # calculate the users rating by getting all post_ratings/rating_count and show this as a percentage
  # this uses the posts rating and count - need to be careful as the rating can be neagitive
  def rating
    total = 0
    count = 0
    self.posts.each do |post|
      total += post.rating_total
      count += post.rating_count
    end
    decimal = total.abs/count.to_f
    if total > 0
      decimal
    else
      0 - decimal
    end
  end

end
