# Randomizer

## Purpose
To return a random popular YouTube video for the user, or a random restaurant from Yelp.


## How To Use
**Because this can get a little complicated to set up, I suggest just looking at my code and [demo video](). I am unable to add test users directly to my Google Cloud project because of quota reasons.**

If you want to use this app, there are a few things you’ll need to do.

### Set up YouTube authentication
1. Go to https://console.cloud.google.com/apis and choose or create the project that you’ll be using
2. Scroll down to the bottom of the page to see if you already have YouTube Data API v3 enabled.
3. If you don't have YouTube Data API v3 enabled ...
   1. Click “Enable APIs and Services” at the top of the page
   2. Search for “YouTube Data API v3” and click the API result that comes up
   3. Click Enable
4. Once it’s enabled, go back to https://console.cloud.google.com/apis and click “OAuth consent screen” on the side
5. If the OAuth Consent Screen isn’t already configured …
   1. I have it set to External Users. I don’t know if this will work for Internal Users, because the option of Internal Users is disabled for me. If in doubt, use external users.
   2. Click Create
6. I believe there’s many OAuth configurations that could work here, so if you already have a configuration that will work you can skip this step. Here’s my specific configuration
   1. I have the app name set to `Randomizer`
   2. I have “User Support Email” set to my own email
   3. I have nothing for App Logo or App Domain
   4. I have “Developer Contact Information” set to my own email
   5. I only no scopes for this project
   6. I have my own username as a Test User
7. Click the “Credentials” tab on the left side
8. Select “Create Credentials” at the top, then click “OAuth client ID”
9. Select iOS as the application type
10. Name it whatever you would like. Randomizer probably makes the most sense.
11. Use `sharell-codes.Randomizer` for the Bundle ID, then click Create
12. Navigate back to https://console.cloud.google.com/apis/credentials. Under “Actions” for the appropriate OAuth Client, click “Download OAuth Client”. Then, click “DOWNLOAD PLIST”
13. Download [Randomizer Public.zip]()
14. Open your terminal and run `cd <insert_project_directory>`
15. Then, run `open Randomizer.xcworkspace`
16. Click File > Add Files to “Randomizer” …
17. Locate the Google PLIST file you downloaded earlier and select it. Then, click “Options”, and select “Copy Items if needed”, “Create Folder References”, and select all boxes for “Add To Targets”. Then Click Add
18. Replace `insert CLIENT_ID` and `insert REVERSED_CLIENT_ID` in the [info plist](). You can find these values in the Google PLIST.
19. Replace `insert CLIENT_ID` in [AppDelegate.swift]() with your client ID.
20. Close the project


### Set Up Yelp Authentication
1. Get API key at https://www.yelp.com/developers/v3/manage_app
2. Replace line 18 of [FindRestaurantViewController.swift]() with your API key that you received from Yelp


### Run the project
You’ll need to run pod install before running it every time. 
1. Open up the terminal.
2. Run `cd <insert_project_directory>`.
3. Run `pod install`.
4. Run `open Randomizer.xcworkspace`.
5. Product > Run or Click the play button in the upper left corner of Xcode.
