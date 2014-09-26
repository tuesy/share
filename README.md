## Overview
I recreated the [Oculus Share](https://share.oculusvr.com) website at http://share.mankindforward.com. This is a study of Share and a quick demonstration of how I approach building and scaling web platforms.

![Screenshot](https://mankindforward.files.wordpress.com/2014/09/share.png)

### Demo Features
Oculus Share is a place for Virtual Reality (VR) developers to showcase their apps. The two primary personas are developers and consumers. Developers can upload their apps (content) and include metadata like likes to videos, screenshot images, setup instructions, etc. Consumers can browse and ultimately download apps for their use. In the interest of time, I've focused on the main consumer use cases: the homepage, the app browser, and the app details page. Based on the data available via the app details page, I designed a schema for the database and then crawled the real site to import the data. Minor models like categories and genres are hard-coded. I also fabricated user-generated data like download counts and ratings to limit the scope of this project. A new feature is the Content Management System (CMS) available at http://share.mankindforward.com/admin. It's very customizable and will be used heavily, I imagine, as the amount of content grows and the editorial team grows along with it. I also added pagination on the apps browser page since right now it loads 370+ apps when you click "All". Note that I've omitted much of the Javascript-heavy functionality like the carousel to save time.

### Suggested Improvements
* Advanced Filtering - It'd be great to mix and match filters like category, genre, and platform with bi-directional sorting.
* Trends and Related - Suggest apps to users based on recent popularity and clustering of user behavior.
* Developer Features - e.g. analytics or messaging other developers.
* Integrations - e.g. Twitch.
* Custom Video Player - Add VR-tailored controls because you can assume users are using an HMD.
* VR Developer Meetups - This would be pretty sweet.
* Many more things I could suggest...

### Performance and Scaling
The first bottlenecks will likely be the homepage and the apps browser. As the number of apps grow, beyond simple query optimization, I'll want to cache as much as possible using a combination of page and fragment caching. It looks like there's already an asynchronous solution in place to insert download counts after DOM-ready so that's good. Performance monitoring with New Relic is in place via a Heroku Add-on. The slowest page is probably the apps browser (old path is /category/all). It probably wouldn't be necessary for a long time, but sharding the database would be necessary eventually. For search, I would upgrade to Elasticsearch at some point since it's free, easy-to-manage, and scales to millions+ of apps.

### Testing
No tests yet but generally I like to use Rspec for unit testing of models and Cucumber for integration tests for websites. Continuous integration can be added later as necesssary. For the integration tests, I'd make sure first and foremost that the developers can always upload and users can always download. I may even want to test for maximum completion times on those flows.

### Deployment
Code is hosted on Github and deployed to Heroku. Deployments incur zero downtime. I start with Heroku because it's fast and free--however, later I would suggest migrating to a PaaS solution like Engineyard or something custom (hybrid cloud?). It seems like the product would need to be agile so delaying managing bare metal would be better.
