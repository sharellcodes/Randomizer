# Randomizer

## Purpose
To return a random popular YouTube video for the user, or a random restaurant from Yelp.


## How It Works
### If you want a random restaurant
1. Click the “Restaurants” button
2. Enter a valid location
   - If it contains invalid characters, you will receive an alert letting you know to enter a location without the characters.
   - If you receive any other error from the Yelp server, you will receive an alert that explains the error. You will then need to restart the app to try again.
3. Once the location is presented to you
   - you can go to the Yelp page by clicking the photo of the restaurant, name of the restaurant, or the address of the restaurant.
   - You can click the “Find another restaurant” button if you’d like to find another restaurant. You would repeat the process of entering a valid location.
   - You can also click the “Find a Youtube Video Instead” if you’d like to find a YouTube video instead. You would need to sign in if you haven’t already, or if
     your auth token wasn’t stored for any other reason. Otherwise, you’ll be presented with a video.

### If you want a random YouTube video
1. Click the “Youtube Video” button
2. You will likely need to sign in at this point, as you didn’t already sign in before.
   - If you sign in with an email that isn’t already authorized to use the app, you will receive this message (see How to Use Randomizer). You can press Cancel. You will then receive an alert saying that you canceled the Sign-in. You can press OK, and try signing in again with a proper account if you have one.
   - If you cancel the sign in, you will receive an alert saying that you canceled the Sign-in. You can press OK, and try signing in again
3. Once the video is presented to you
   - You can go to the YouTube video page by clicking the video’s thumbnail, clicking the name of the video, or clicking the channel name.
   - You can find another video by clicking “Find Another Video”. You should be able to immediately get presented with a new video, as you’ve already signed in. If you receive an error along the lines of “you haven’t been authorized”, please restart the app.
   - You can find a restaurant instead by clicking the “Find a Restaurant Instead” button.

### If you don’t have a preference of a YouTube video or restaurant
If you don’t have a preference of a YouTube video or restaurant, click the “Literally Anything” button. Follow the applicable steps based on the storyboard presented to you.


## If You Want to Use the App
**Because this can get a little complicated to set up, I suggest just looking at my code and [demo video](https://github.com/sharellcodes/Randomizer/blob/main/Randomizer%20Demo%20-%20480p.mov). I am unable to add test users directly to my Google Cloud project because of quota reasons.**

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
   5. Click "Save and Continue"
   6. I have no scopes for this project
   7. I have my own username as a Test User
7. Click the “Credentials” tab on the left side
8. Select “Create Credentials” at the top, then click “OAuth client ID”
9. Select iOS as the application type
10. Name it whatever you would like. Randomizer probably makes the most sense.
11. Use `sharell-codes.Randomizer` for the Bundle ID, then click Create
12. Navigate back to https://console.cloud.google.com/apis/credentials. Under “Actions” for the appropriate OAuth Client, click “Download OAuth Client”. Then, click “DOWNLOAD PLIST”
13. Download [Randomizer Public.zip](https://github.com/sharellcodes/Randomizer/blob/main/Randomizer%20Public.zip)
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
