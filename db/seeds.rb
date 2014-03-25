User.destroy_all
Post.destroy_all
Category.destroy_all

u1 = User.create(:name => 'Kriss', :email => "kriss@iWitness.com", :image => "https://pbs.twimg.com/profile_images/378800000791214266/91d5a6b1e45bb7b5d7d2cba132dcf59d.jpeg", :address => "16 Catherine st, leichhardt")
u2 = User.create(:name => 'Sally', :email => "sally@iWitness.com", :image => "http://www.mondaq.com/images/profile/individual/lady.jpg", :address => "18 Catherine st, leichhardt")
u3 = User.create(:name => 'Mum', :email => "mum@iWitness.com", :image => "http://wtaa.com.au/images/education-summit/speakers/Inta_Heimanis.jpg", :address => "20 dixson avenue, dulwich hill")

p1 = Post.create(:title => 'News is happening!', :body => "Lots of text about the news item that happened at this point - ooh it's exciting isn't it!", :image => 'http://www.myfuturebuilding.org/wp-content/gallery/city-building/city-buildings.jpg', :address => "parramatta rd, petersham", :rating_up => 1, :rating_down => 0)
p2 = Post.create(:title => 'Car crash!', :body => "Is blocking traffic on parramatta road", :image => 'http://villagetattler.com/wp-content/uploads/2011/02/park-ave-crash-2.jpg', :address => "parramatta rd, leichhardt", :rating_up => 5, :rating_down => 0)
p3 = Post.create(:title => 'Pigs Fly', :body => "I guess the cost of bacon will obviously go up too then", :image => 'http://trekbikes.typepad.com/.a/6a00d83453a62f69e2016306582522970d-500wi', :address => "parramatta rd, stanmore", :rating_up => 22, :rating_down => 98)

c1 = Category.create(:title => 'traffic')
c2 = Category.create(:title => 'general interest')
c3 = Category.create(:title => 'other')

# Associate categories and posts
c1.posts << p2
c2.posts << p1 << p2 << p3
c3.posts << p3

# Associate Posts to users
u1.posts << p1 << p2
u2.posts << p3
