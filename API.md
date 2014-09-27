# Overview
This RESTful API provides programmatic access to read and write Oculus Share data. Developers can manage their apps, search for apps, and manage comments for apps. Responses are provided in JSON.

### General Topics
* Authentication and Authorization - In the future, authorization may be handled with OAuth and developers will be restricted to only managing apps they own.
* Pagination - Responses are paginated with a default page size of 10 for performance. However, you may specify a page size of up to 50 for your convenience.
* Rate Limiting - In the future, you may be limited to a number of API calls per hour or per day.
* Versioning - This API may change from time to time. Major changes may require creating separate versions.

### Notes
* While comments are designed as a nested resource of apps, they are implemented as a top-level resource for now. The responses would be the same.

### Sample Client Libraries
##### Ruby
There will be a Ruby library using ActiveResource that wraps the API for ease of use. A beta version of this library is built into this app and can be tested with this rake task:

    bundle exec rake -t example

Here are some [sample output](https://gist.github.com/tuesy/809b92981656fa5e1539) for this command running in development and the accompanying [server log](https://gist.github.com/tuesy/2b865a6daebf8be299c4).

# Endpoints
* Apps
    * POST /api/apps.json
    * GET /api/apps/:id
    * PUT /api/apps/:id
    * DELETE /api/apps/:id
    * GET /api/apps/:id/download
    * GET /api/apps/search
* Comments
    * POST /api/apps/:id/comments
    * GET /api/apps/:app_id/comments/:comment_id
    * PUT /api/apps/:app_id/comments/:comment_id
    * DELETE /api/apps/:app_id/comments/:comment_id
    * GET /api/apps/:app_id/comments

### POST /api/apps.json
Create an app

##### Parameters
* title - max 255 characters
* short_description - max 1024 characters
* author - max 255 characters
* price - in dollars and cents (e.g. 5.00 for $5)

##### Example Request

    POST /api/apps.json?title=VeRy+Angry+Birds&short_description=Play+as+the+birds+or+as+the+pigs!&author=Parzi&price=0.99

##### Example Response

    {"id":594,"title":"VeRy Angry Birds","youtube_embed_url":null,"primary_screenshot":null,"screenshot1":null,"screenshot2":null,"screenshot3":null,"screenshot4":null,"screenshot5":null,"platforms":null,"long_description":null,"short_description":"Play as the birds or as the pigs!","minimum_system_requirements":null,"setup_instructions":null,"version_and_notes":null,"known_bugs":null,"controllers":null,"modes":null,"category_id":null,"user_id":null,"released_at":null,"publisher":null,"support_email":null,"paypal_id":null,"donation_email":null,"facebook_url":null,"twitter_url":null,"kickstarter_url":null,"youtube_url":null,"googleplus_url":null,"linkedin_url":null,"credits":null,"copyrights":null,"disclaimers":null,"rift_versions":null,"developer":null,"created_at":"2014-09-27T22:20:03.067Z","updated_at":"2014-09-27T22:20:03.067Z","rating":0.0,"author":"Parzi","price":0.99}

### GET /api/apps/:id
Get an app's metadata using its ID

##### Parameters
* app_id - e.g. 594

##### Example Request

    GET /api/apps/594.json

##### Example Response

    {"id":594,"title":"VeRy Angry Birds","youtube_embed_url":null,"primary_screenshot":null,"screenshot1":null,"screenshot2":null,"screenshot3":null,"screenshot4":null,"screenshot5":null,"platforms":null,"long_description":null,"short_description":"Play as the birds or as the pigs!","minimum_system_requirements":null,"setup_instructions":null,"version_and_notes":null,"known_bugs":null,"controllers":null,"modes":null,"category_id":null,"user_id":null,"released_at":null,"publisher":null,"support_email":null,"paypal_id":null,"donation_email":null,"facebook_url":null,"twitter_url":null,"kickstarter_url":null,"youtube_url":null,"googleplus_url":null,"linkedin_url":null,"credits":null,"copyrights":null,"disclaimers":null,"rift_versions":null,"developer":null,"created_at":"2014-09-27T22:20:03.067Z","updated_at":"2014-09-27T22:20:03.067Z","rating":0.0,"author":"Parzi","price":0.99}

### PUT /api/apps/:id
Update an app's metdata using its ID

##### Parameters
* title - max 255 characters
* short_description - max 1024 characters
* author - max 255 characters
* price - in dollars and cents (e.g. 5.00 for $5)

##### Example Request

    PUT /api/apps/594.json

##### Example Response

    {}

### DELETE /api/apps/:id
Deleting an app using its ID

##### Parameters
* app_id - e.g. 594

##### Example Request

    DELETE /api/apps/594.json

##### Example Response

    {}

### GET /api/apps/:id/download
Downloading an app's binary file

##### Parameters
* app_id - e.g. 594

##### Example Request

    GET /api/apps/594/download.json

##### Example Response

    (binary file - e.g. robots.zip)

### GET /api/apps/search
Searching apps

##### Parameters
You can search title, short_description, author, or by price range. Queries are case insensitive (e.g. "awe" in "Angry Birds is Awesome") and match anywhere in the fields. Sorting and pagination are also supported. All parameters are optional

* q - search query (e.g. "awe" for Awesome)
* max_price - highest price, inclusive, as a float (e.g. 49.99)
* min_price - lowest price, inclusive, as a float (e.g. 0.99)
* sorting[sort] - title (default), author, price
* sorting[dir] - asc (default), desc
* page - integer page number (default is 1)
* per_page - integer number of resources per page (default is 10, max is 50)

##### Example Request

    GET /api/apps/search?q=shark&sorting[sort]=price&sorting[dir]=desc

##### Example Response

    [{"id":354,"title":"Ocean Rift","youtube_embed_url":null,"primary_screenshot":"https://d39nlaid7cu5vo.cloudfront.net/shareuploads/apps/13800645308434zl7b65hfr/screens/1378553927916ec603fvfgvi_1378554494778.png","screenshot1":"https://img.youtube.com/vi/tUEXgpOQYe0/0.jpg","screenshot2":"https://d39nlaid7cu5vo.cloudfront.net/shareuploads/apps/13800645308434zl7b65hfr/screens/1378553927916ec603fvfgvi_1378555435875.png","screenshot3":"https://d39nlaid7cu5vo.cloudfront.net/shareuploads/apps/13800645308434zl7b65hfr/screens/1378553927916ec603fvfgvi_1378555446784.png","screenshot4":"https://d39nlaid7cu5vo.cloudfront.net/shareuploads/apps/13800645308434zl7b65hfr/screens/1378553927916ec603fvfgvi_1378555455102.png","screenshot5":"https://d39nlaid7cu5vo.cloudfront.net/shareuploads/apps/13800645308434zl7b65hfr/screens/1378553927916ec603fvfgvi_1378555456474.png","platforms":"pc","long_description":"\u003cdiv class=\"appDesc shadow\"\u003e\n\u003cp\u003e\n\t          The idea behind Ocean Rift is to showcase different techniques for simulating a vivid underwater experience in VR. This includes experimenting with different sounds, animals, plant life, ocean current effects, particle systems (dust, bubbles etc.).\n\u003c/p\u003e\n\u003cp\u003e\n\t        There is also a horror aspect to Ocean Rift as in the deepest parts of the environment you will find a giant prehistoric Megalodon shark that has a tendancy of sneaking up on people. In all honesty you shouldn't really go down there, and you should definitely warn anyone else thinking about trying this demo about him too!\n\u003c/p\u003e\n\u003c/div\u003e\n","short_description":"\n\n\t          The idea behind Ocean Rift is to showcase different techniques for simulating a vivid underwater experience in VR. This includes experimenting with different sounds, animals, plant life, ocean current effects, particle systems (dust, bubbles etc.).\n\n\n\t        There is also a horror aspect to Ocean Rift as in the deepest parts of the environment you will find a giant prehistoric Megalodon shark that has a tendancy of sneaking up on people. In all honesty you shouldn't really go down there, and you should definitely warn anyone else thinking about trying this demo about him too!\n\n\n","minimum_system_requirements":"\u003cdiv class=\"tabBoxInner\"\u003e\u003cp\u003e\n\t  Intel i5 or equivalent. GeForce GTX570+ for smooth 60 fps experience.\n\u003c/p\u003e\u003c/div\u003e","setup_instructions":"\u003cdiv class=\"tabBoxInner\"\u003e\n\u003cdiv\u003e\n\t  Notes:\n\u003c/div\u003e\n\u003cdiv\u003e\n\t  Left Trigger (Mouse 2, LShift) to swim up, Right Trigger (Mouse 1, LCTRL) to swim down. A button to jump/swim fast.\n\u003c/div\u003e\n\u003cdiv\u003e\n\t  Demo works best with a controller and headphones. I highly recommend setting the volume quite high as it adds a lot to the atmosphere when there's plenty of bass.\n\u003c/div\u003e\n\u003c/div\u003e","version_and_notes":"1.03","known_bugs":null,"controllers":"Keyboard, Mouse, Gamepad","modes":"Single-Player","category_id":3,"user_id":48,"released_at":null,"publisher":"May 31, 2013","support_email":null,"paypal_id":null,"donation_email":null,"facebook_url":null,"twitter_url":null,"kickstarter_url":null,"youtube_url":"https://www.youtube.com/watch?v=tUEXgpOQYe0","googleplus_url":null,"linkedin_url":null,"credits":null,"copyrights":null,"disclaimers":null,"rift_versions":"DK1, DK2","developer":"Llyr ap Cenydd","created_at":"2014-09-25T19:15:43.733Z","updated_at":"2014-09-27T20:27:44.896Z","rating":2.8,"author":"sfaok","price":30.99},{"id":449,"title":"Survival","youtube_embed_url":null,"primary_screenshot":"https://d39nlaid7cu5vo.cloudfront.net/shareuploads/apps/1410559565214p9gaz1714i/screens/1410036070005m858e86ko6r_1410038981691.png","screenshot1":"https://img.youtube.com/vi/uXRG24WdmWM/0.jpg","screenshot2":"https://d39nlaid7cu5vo.cloudfront.net/shareuploads/apps/1410559565214p9gaz1714i/screens/1410036070005m858e86ko6r_1410039125243.png","screenshot3":"https://d39nlaid7cu5vo.cloudfront.net/shareuploads/apps/1410559565214p9gaz1714i/screens/1410036070005m858e86ko6r_1410556257059.png","screenshot4":null,"screenshot5":null,"platforms":"pc","long_description":"\u003cdiv class=\"appDesc shadow\"\u003e\u003cp\u003e\n\t     Survival is a simple yet addictive retro style game based off of games like \"shark! shark!\" for the Intellivision.\u003cbr\u003e\n\t \u003cbr\u003e\n\t     Objective: Eat enemies The same size or smaller than you while avoiding the bigger enemies. As you eat you will grow. Score big to level up! Each level gets a bit faster.\u003cbr\u003e\n\t \u003cbr\u003e\n\t     -- Keyboard Controls --\u003cbr\u003e\n\t     Space: Select\u003cbr\u003e\n\t     Escape: Back\u003cbr\u003e\n\t     Mouse: Move\u003cbr\u003e\n\t \u003cbr\u003e\n\t     -- Joystick Controls --\u003cbr\u003e\n\t     A button: Select\u003cbr\u003e\n\t     B button: Back\u003cbr\u003e\n\t     Left Analog Stick: Move\u003cbr\u003e\n\t \u003cbr\u003e\n\t     The game is random when it comes to what size enemies will appear, and their speed. Every time you play will be different than the last.\u003cbr\u003e\n\t \u003cbr\u003e\n\t     There are 4 difficulty levels: Easy, Medium, Hard and Insane. Challenge your friends to beat your high score!\n\u003c/p\u003e\u003c/div\u003e\n","short_description":"\n\t     Survival is a simple yet addictive retro style game based off of games like \"shark! shark!\" for the Intellivision.\n\t \n\t     Objective: Eat enemies The same size or smaller than you while avoiding the bigger enemies. As you eat you will grow. Score big to level up! Each level gets a bit faster.\n\t \n\t     -- Keyboard Controls --\n\t     Space: Select\n\t     Escape: Back\n\t     Mouse: Move\n\t \n\t     -- Joystick Controls --\n\t     A button: Select\n\t     B button: Back\n\t     Left Analog Stick: Move\n\t \n\t     The game is random when it comes to what size enemies will appear, and their speed. Every time you play will be different than the last.\n\t \n\t     There are 4 difficulty levels: Easy, Medium, Hard and Insane. Challenge your friends to beat your high score!\n\n","minimum_system_requirements":"\u003cdiv class=\"tabBoxInner\"\u003e\u003cp\u003e\n\t     This game is very simplistic, so it should run well on a wide variety of PCs.\n\u003c/p\u003e\u003c/div\u003e","setup_instructions":"\u003cdiv class=\"tabBoxInner\"\u003e\u003cp\u003e\n\t     This game is very simplistic, so it should run well on a wide variety of PCs.\n\u003c/p\u003e\u003c/div\u003e","version_and_notes":"1.4","known_bugs":null,"controllers":"Keyboard, Mouse, Gamepad","modes":"Single-Player","category_id":2,"user_id":228,"released_at":null,"publisher":"September 6, 2014","support_email":null,"paypal_id":null,"donation_email":null,"facebook_url":null,"twitter_url":null,"kickstarter_url":null,"youtube_url":"https://www.youtube.com/watch?v=uXRG24WdmWM","googleplus_url":null,"linkedin_url":null,"credits":null,"copyrights":null,"disclaimers":null,"rift_versions":"DK1, DK2","developer":"Rubixcube6","created_at":"2014-09-25T19:18:16.490Z","updated_at":"2014-09-27T20:27:44.704Z","rating":4.4,"author":"rubixcube6","price":25.99},{"id":323,"title":"Lost Loot","youtube_embed_url":null,"primary_screenshot":"https://d39nlaid7cu5vo.cloudfront.net/shareuploads/apps/1406764722266tu5pbsxlxr/screens/14008197419089oq0jcyp66r_1400819915066.png","screenshot1":"https://img.youtube.com/vi/9vhcOUkdQBI/0.jpg","screenshot2":"https://d39nlaid7cu5vo.cloudfront.net/shareuploads/apps/1406764722266tu5pbsxlxr/screens/14008197419089oq0jcyp66r_1400819931280.png","screenshot3":"https://d39nlaid7cu5vo.cloudfront.net/shareuploads/apps/1406764722266tu5pbsxlxr/screens/14008197419089oq0jcyp66r_1400819955122.png","screenshot4":"https://d39nlaid7cu5vo.cloudfront.net/shareuploads/apps/1406764722266tu5pbsxlxr/screens/14008197419089oq0jcyp66r_1400819934918.png","screenshot5":"https://d39nlaid7cu5vo.cloudfront.net/shareuploads/apps/1406764722266tu5pbsxlxr/screens/14008197419089oq0jcyp66r_1400819960680.png","platforms":"pc","long_description":"\u003cdiv class=\"appDesc shadow\"\u003e\n\u003cp\u003e\n\t \u003cstrong\u003eA MYSTERIOUS UNCHARTED ISLAND...\u003c/strong\u003e\n\u003c/p\u003e\n\u003cp\u003e\n\t \u003cem\u003e\u003cstrong\u003e\u003c/strong\u003eYou are a lone archaeologist who has just discovered the resting place of a long lost pirate treasure fleet!  Over two hundred years ago the notorious pirate queen Ching Shih lost an armada of junks laden with gold, jewels, and artifacts in a ferocious storm in the South China Sea.  The remains of her Red Flag treasure fleet now rests near a mysterious uncharted island and only you know about it…  Are you ready to unravel the mysteries hidden there and claim the treasure for yourself?  Do you have what it takes to be a treasure hunter?  Go find out!\u003c/em\u003e\n\u003c/p\u003e\n\u003cp\u003e\n\t \u003cstrong\u003eEXPLORATION, TREASURE HUNTING, AND SURVIVAL...\u003c/strong\u003e\n\u003c/p\u003e\n\u003cul\u003e\n\t\u003cli\u003eExplore a beautiful tropical island and the surrounding ocean, snorkeling in the reefs or diving in the deeper waters.\u003c/li\u003e\n\t\u003cli\u003eFind ancient underwater ruins and sunken shipwrecks and search them for treasure and artifacts.\u003c/li\u003e\n\t\u003cli\u003eWatch your air supply, be careful how deep you go, and don’t get bitten by the sharks, or you could start a frenzy!\u003c/li\u003e\n\t\u003cli\u003eImprove your treasure hunting prowess with each discovery, unlocking new equipment and upgrading abilities that allow you to swim faster, go deeper, and stay down longer.\u003c/li\u003e\n\t\u003cli\u003eRecover all of the fabled lost treasure while unraveling the history of the island, the pirates, and the mystery that lies beneath.\u003c/li\u003e\n\u003c/ul\u003e\n\u003c/div\u003e\n","short_description":"\n\n\t \n\n\n\t \n\n\n\t \n\n\n\t\n\t\n\t\n\t\n\t\n\n\n","minimum_system_requirements":"\u003cdiv class=\"tabBoxInner\"\u003e\n\u003cp\u003e\n\t    Lost Loot is a casual adventure game designed exclusively for VR.  The game is currently only available for Windows and you MUST have an Oculus Rift DK1 (DK2 support coming in the next update) and preferably an XBOX 360 controller to play (keyboard and mouse is also supported).\n\u003c/p\u003e\n\u003cp\u003e\n\t    The game requires a computer with a minimum of 2GB of RAM and a dedicated GPU with a minimum of 1GB VRAM - likely any desktop or higher end laptop made in the last few years will work.\n\u003c/p\u003e\n\u003c/div\u003e","setup_instructions":"\u003cdiv class=\"tabBoxInner\"\u003e\n\u003cp\u003e\n\t    Unzip the Lost Loot .zip archive anywhere you would like and then run the Lost Loot .exe executable in the folder created. It will automatically use the calibration setup from the Oculus Configuration Utility. Run the Oculus Configuration Utility to create and select your calibration profile (includes IPD measurement, magnetometer calibration, etc.) before you play. This only needs to be done once and if you have played other Oculus Rift games you probably already did this and can just run the game.\n\u003c/p\u003e\n\u003cp\u003e\n\t    After running the .exe adjust the resolution and quality settings. It is recommended that you try the defaults first (1280x800 and Good). If you have a more powerful system you can also try running it at 1920x1200 which will give a much better visual experience.\n\u003c/p\u003e\n\u003cp\u003e\n\t    It is highly recommended that the resolution and quality be set low enough to keep the frame rate at a solid 60 fps. Use F3 to toggle the frame rate counter on and off while the game is running and check the frame rate you are getting. Use F1 and F2 to decrease/increase the quality while the game is running.\n\u003c/p\u003e\n\u003cp\u003e\n\t    Once the game is started the menu is shown. Face forward and reset the view if needed. Then adjust the gameplay options and select PLAY to start. Use Exploration Mode if you don’t like things attacking you or jumping out at you. Everything is automatically saved between sessions so you can just quit the game at any time. Select RESET to erase the current progress and start a new game. The controls are shown via in game help so you can start playing immediately and figure out the controls as you go.\n\u003c/p\u003e\n\u003cp\u003e\n\t    See the complete \u003ca href=\"http://www.pixelatedramblings.com/p/lost-loot-instructions.html\"\u003einstructions\u003c/a\u003e for details on getting started, controls, equipment, and tips.\n\u003c/p\u003e\n\u003c/div\u003e","version_and_notes":"Pre-Alpha 1c","known_bugs":null,"controllers":"Keyboard, Mouse, Gamepad","modes":"Single-Player","category_id":5,"user_id":128,"released_at":null,"publisher":"May 19, 2014","support_email":null,"paypal_id":null,"donation_email":null,"facebook_url":null,"twitter_url":null,"kickstarter_url":null,"youtube_url":"https://www.youtube.com/watch?v=9vhcOUkdQBI","googleplus_url":null,"linkedin_url":null,"credits":"\u003cdiv class=\"appCredits shadow\"\u003e\u003cp\u003e\n\t   Created by Michael Schenck\n\u003c/p\u003e\u003c/div\u003e\n","copyrights":null,"disclaimers":null,"rift_versions":"DK1","developer":"Michael Schenck","created_at":"2014-09-25T19:14:53.171Z","updated_at":"2014-09-27T20:27:44.412Z","rating":2.8,"author":"MichaelSchenck","price":11.99}]

### POST /api/apps/:id/comments
Creating a comment for an app using its ID

##### Parameters
* app_id - e.g. 594
* text - e.g. "best app evar"

##### Example Request

    POST /api/apps/594/comments.json

##### Example Response

    {"id":27,"text":"VeRy fun indeed! ;-)","app_id":594,"created_at":"2014-09-27T22:20:03.248Z","updated_at":"2014-09-27T22:20:03.248Z"}

### GET /api/apps/:app_id/comments/:comment_id
Reading a comment

##### Parameters
* comment_id

##### Example Request

    GET /api/apps/594/comments/1

##### Example Response

    {"id":27,"text":"VeRy fun indeed! ;-)","app_id":594,"created_at":"2014-09-27T22:20:03.248Z","updated_at":"2014-09-27T22:20:03.248Z"}

### PUT /api/apps/:app_id/comments/:comment_id
Updating a comment

##### Parameters
* comment_id

##### Example Request

    PUT /api/apps/594/comments/1

##### Example Response

    {}

### DELETE /api/apps/:app_id/comments/:comment_id
Deleting a comment

##### Parameters
* comment_id

##### Example Request

    DELETE /api/apps/594/comments/1

##### Example Response

    {}

### GET /api/apps/:app_id/comments
Listing all comments for an app

##### Parameters
* app_id
* page - e.g. 2
* per_page - e.g. 25

##### Example Request

    GET /api/apps/594/comments

##### Example Response

    [{"id"=>27, "text"=>"too fast", "app_id"=>594, "created_at"=>"2014-09-27T22:20:03.248Z", "updated_at"=>"2014-09-27T22:20:03.366Z"}]
