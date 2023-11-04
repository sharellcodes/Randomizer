# Features and Functions

## Summary
I created this app to practice my general Swift development skills, my ability to operate with popular APIs, and to continue exercising my general programming skills.

## Key Feature(s)

### API Calls for Youtube Data
- [Getting Authorization for the API](https://github.com/sharellcodes/Randomizer/blob/main/Randomizer%20Public/GoogleSignInViewController.swift#L39)
  <img width="800" alt="API Calls for Youtube Data - Getting authorization for the API" src="https://github.com/sharellcodes/Randomizer/assets/123710848/735d36f8-b638-42f8-910f-3b0a30e04c6b">

- [Creating a request for YouTube’s server](https://github.com/sharellcodes/Randomizer/blob/main/Randomizer%20Public/FindVideoViewController.swift#L24)
  <img width="850" alt="API calls for Youtube Data - Creating a request for YouTube’s server" src="https://github.com/sharellcodes/Randomizer/assets/123710848/a550dfc4-25da-453a-bb88-28cd09dbff15">

- [Access the data from the response](https://github.com/sharellcodes/Randomizer/blob/main/Randomizer%20Public/FindVideoViewController.swift#L34)
  <img width="825" alt="API calls for Youtube Data - Access the data from the response" src="https://github.com/sharellcodes/Randomizer/assets/123710848/c6e99675-150e-4fa4-a2c5-fa171194fd15">



### HTTP Requests using the URLSession API
- [Requesting JSON data from Yelp](https://github.com/sharellcodes/Randomizer/blob/main/Randomizer%20Public/FindRestaurantViewController.swift#L34)
  <img width="850" alt="Yelp API - Requesting JSON data from Yelp" src="https://github.com/sharellcodes/Randomizer/assets/123710848/77cbfad8-a504-4bff-a0ec-13d7fde5e98c">

- [Uploading an image from a URL](https://github.com/sharellcodes/Randomizer/blob/main/Randomizer%20Public/GlobalsViewController.swift#L28)
  <img width="831" alt="Upload Image HTTP Request" src="https://github.com/sharellcodes/Randomizer/assets/123710848/e0d8b767-525f-448c-b9ca-407bcf704e70">



## General Programming Highlights

### Asynchronous Coding
- During the use of the URLSession API, the code within that closure isn’t running on the main thread. There were things that needed to be done within that closure, but could only be done on the main thread. Asynchronous was the solution.
- [An Example](https://github.com/sharellcodes/Randomizer/blob/main/Randomizer%20Public/FindRestaurantViewController.swift#L73)
  <img width="899" alt="Dispatch Queue" src="https://github.com/sharellcodes/Randomizer/assets/123710848/777e101a-cc67-4ce0-a656-d378817abbe2">


### Regular Expressions
- Used for making sure the location that the user enters is a proper location string ([code](https://github.com/sharellcodes/Randomizer/blob/main/Randomizer%20Public/GetLocationViewController.swift#L30)).
  <img width="769" alt="Regular Expressions" src="https://github.com/sharellcodes/Randomizer/assets/123710848/b9400e04-3ac4-45e0-aa2e-b67bfb752bdb">



## General Swift Highlights
- [Presenting specific storyboards based on specific conditions](https://github.com/sharellcodes/Randomizer/blob/main/Randomizer%20Public/ShowRestaurantViewController.swift#L58)
  <img width="850" alt="storyboard navigation" src="https://github.com/sharellcodes/Randomizer/assets/123710848/a7ad2a0f-fbbd-4729-a6e8-d8ff30a2c6dd">
  

- Codable structs for parsing JSON data from Yelp
  [[1]](https://github.com/sharellcodes/Randomizer/blob/main/Randomizer%20Public/FindRestaurantViewController.swift#L64)
  <img width="825" alt="codable struct I" src="https://github.com/sharellcodes/Randomizer/assets/123710848/de592585-0ae2-4542-9e25-a9843560a005">
  [[2]](https://github.com/sharellcodes/Randomizer/blob/main/Randomizer%20Public/FindRestaurantViewController.swift#L113)
  <img width="293" alt="codable struct II" src="https://github.com/sharellcodes/Randomizer/assets/123710848/7b1ca377-ecb2-4230-8472-f5e16f2a79a0">


- Object Oriented Programming
