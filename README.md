wdi_project_01
==============
#epicentre - local news and events application

http://whatsat.herokuapp.com/

---

##What's the point of this?

To provide an easy to use way of finding out what's going on around you. This differs to twitter or a news site where you need to know what to search for, it is instead lcocation based.

I would like to think that this kind of thing would be useful during a local emergency (bushfires, riots, flood, storms etc) as you can see what's going on around you instantly without the need to search/friend/follow any particular person/hashtag/category.

The original idea came from a couple of weeks ago when there were helicopters buzzing over my house all night. I had no ised what was going on, and didn't really know how to find out. I could have opened twitter and maybe searched #petersham #helicopter or similar but I didn't think that far - I wanted an app to tell me: A man had been shot in the next suburb.

it could also become a useful community tool - helping people in the community connect via an easy community noticeboard.

###Other Possible Applications

where are they app (or - sticking it to the man) - to help people monitor the location of police, parking officers, ticket inspectors etc.

what's going on - rather than posting at current time, allow people to post future events, then poeple could quickly easily find out what's going on around them at pubs/bars/venues.

---

##What will it need?

Three models (maybe four)
- registered user
- posts
- post updates (these are also a post but they belong to the initial post) - these weren't used in the end but I would like to add this later
- post categories could also be a model?

##Intended flow

###viewing news/events

1. a user goes to the app and it initially shows a local map, with point markers overlayed - default settings would be a small radius (up to 2-5km?) and recent posts only (last 2-3 hours?)
2. user can click a point marker to find out what's going on at that point
3. user can then update that post with more news about it, or they can also confrim/deny that what was posted was true (user must register/login to comment or confirm/deny)

###posting news/events

1. if you see something going on, you can post quickly and easily (must be registered and logged in though). It owuld be nice to be able to add a photo, headline, body copy and select categories (through set categories? or make this organic?). Geolocation needs to also be saved (it's the whole point!)
2. if you see something and someone has already posted it, the system should prompt you to update the previous post instead of posting new

---

Resources - Gems

###GeoCoder

saving locations and refering to locations will rely on a geolocation gem - http://www.rubygeocoder.com/ - allows use of lat/long

###GoogleMapsForRails

presenting info on a map will require somehting like - https://github.com/apneadiving/Google-Maps-for-Rails - which promises custom map presentation, multiple markers etc.

I didn't use this in the end - instead I implemented Googles v3 js api directly.

===

#The Wrap Up 
###(things I've learned - What I'd like to do Next)

##The Process

It's easy to look at something you've made and point out all the mistakes... I'm pretty proud of some of the stuff I acheived on this. A brief run down of what was acheived in ONE WEEK:

1. The first day (Friday) was spent on basic planning and working out of models and their various relations and attributes
2. Saturday - was spent gettign all the basic CRUD stuff set up for Posts, Users and Categories. I also got the Geocoder gem installed/workign (it was actually pretty easy). 
3. Sunday - I spent a lot of time getting google maps to show on a page the way I wanted them to, and started setting up my search box.
4. Monday - More messing with maps
5. Tuesday - I started freaking out - I has a mess of pages with no navigation and no styling, just a bunch of data that prints out on random pages. I spent most of Tuesday trying to make sense of what I had created so far. I began to lament my total lack of planning documentation (at least a simple idea of page layout and flow would help!). We also test deployed to heroku (and found many issues).
6. Wednesday - I don't think I acheived much on Wednesday. I argued with a lot of javascript and my own stupid pig headedness that I NEEDED certain features (I didn't need them). Working through till 2am seemed pretty normal by this point.
7. Thursday - Added image uploading ability and a lot of extra little features. SO MANY extra little features. Uploaded to heroku and tested. Happy days. Then I had a brainfart and decided to redo the home and maps pages (you know - MOST of the site). Best memory of thursday is about 7.30pm when I realised I had NOT pushed to git hub in hours and not a single page was working... my brain could not even process reading the error message... despair. Luckily Sally came home and fed me and I was able to get bac into gear. 2am? Pffft. I'll see you and raise you.
8. Friday. I slept in. I ate breakfast. I did everything I could to avoid opening up my computer and see errors everywhere. I faced my fears and guess what... it works! Of course NOW i started bug testing... yes! It works on my phone... but there are issues...

##What Did I learn?

Wow. I don't think I can write it all down, but some highlights:

1. PLAN project - yeah sure, you'll make a lot up as you go along, but if you don't have notes to refer to, your brain WILL melt as you try to remember all of the ties between models, views, apis, helpers, partials, your vague memory of what you thought it might look like, how to use git, and what your name is... it all gets to much. i forgot to pay rent again too.
2. STICK to your plan - yes, you'll come up with cool ideas as you go, you can't do it all. Do the basics of what you need first, then build on it.
3. SPLIT models/views/controllers - I know i didn't do this well, and I want to work on it.
4. LAYOUT IS IMPORTANT - and shoudln't be left to the very end - if you're just looking at lines of text it's hard to see what you were trying to acheive, once I had a layout in place I was able to get much more done, as I could see where I was missing things and where I wanted things to be.
5. BRANCH and SUBMIT often.
6. PRY and RAILS CONSOLE are the best things ever invented. If I see them in a bar, I'll buy them a drink.

##What Hurt?
* I didn't plan anywhere near enough, this made life very hard. Juggling balls that you have no physical representaion of is very difficult.
* Because I didn't have a set plan I also didn't know what features to include as I came up with them, this mean some sides are really over done while others are totaly underdone (don't look for categories).
* Trying to add relationships between posts and users for voting - I tried to add this too late in the game, not a good idea.

##What Else Would I Do? I'd love to take this further - just for my own project
* Make it properly mobile responsive
* Get image uploading working better
* Add relationships between posts (so you can have related posts - if this could be auto-suggested through keyword or location it would be great)
* Have an email alert - if news happens near your location
* Add a comment feature
* A search refine feature by time/distance/category etc (i have distance and location already)

##My Favourite Bits
* It's finished (for now)
* FLASH messages are awesome - I think you should be able to create flash messages for pretty much every action, this makes the app so much freindlier
* Partials - once I worked out I was iterating the same loop on multiple post and user pages I was pretty happy to get a nice partial for this happening. I think this should be used more... maybe some planning would help identify where these can be used more
* I spent a lot of time on some rubbish javascrtipt/css tranistions - I know they weren't the point of the project but I think little things like this can add a lot of 'nice' to a project

===

#THanks!

Bloody everyone!
