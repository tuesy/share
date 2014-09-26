## Overview
This RESTful API provides programmatic access to read and write Oculus Share data. Developers can manage their apps, search for apps, and manage comments for apps. Responses are provided in JSON.

### General Topics
* Authentication and Authorization - In the future, authorization may be handled with OAuth and developers will be restricted to managing apps they own.
* Pagination - Responses are paginated with a default page size of 10 for performance. However, you may specify a page size of up to 50 for your convenience.
* Rate Limiting - In the future, you may be limited to a number of API calls per hour/day.
* Versioning - This API may change from time to time. Major changes to likely necessitate a separate version.

## Endpoints
#### Creating Apps
Apps have four fields:
* title - max 255 characters
* short_description - max 1024 characters
* author - max 255 characters
* price - in dollars and cents (e.g. 5.00 for $5)
#### Reading an App
#### Updating Apps
#### Deleting Apps
#### Downloading Apps
#### Searching Apps
* Can search title, short_description, author, or price range
* Searches for title, short_description, and author are case-insensitive with substring matches (e.g. "awe" in "Angry Birds is Awesome")
* Can also search by max_price and/or min_price (e.g. ?max_price=5.0)
* Can sort results by title, author or price (e.g. sort=title, dir=desc)
* Results are paginated at 10 results per page, which is configurable (e.g. page=1, per_page=15) and max results per page is 50

#### Listing Comments for an App
#### Creating Comments for an App
#### Updating Comments for an App

## Sample Clients
### Ruby
(see example.rb)
