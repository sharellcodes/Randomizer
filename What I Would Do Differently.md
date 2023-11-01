There are a few things I would do differently if I were to come back to this project.

- I would make sure the authorizer is still good after I get a video the first time (Since I expect it to be, I just have it automatically looking for another video with the previous authorization).
- I would work on finding a way to make the Google authorization global so that I don’t have to keep passing it back and forth.
- Since I was mostly trying to focus on the usage of the APIs and some other UI functionalities, I didn’t get to make use of stack views. I would do that if I had more time.
- I would give the user the opportunity to use their current location.
- I would give the user the opportunity to start over without restarting the app if they receive any errors from any request.
- For the google sign in, this is single user. If you want to use another account to sign in, you’ll have to restart the app.
- I would have the user manually enter their API key in a text field, so that it isn’t hard coded and easier to obscure later on. I would also make sure they could continue using that key if they want, so that they don’t have to keep entering the key.
- I would give an option to use the previously entered location instead of needing to write it over and over.
- I would address the run-time warnings that come up (`The iOS Simulator deployment target 'IPHONEOS_DEPLOYMENT_TARGET' is set to 8.0, but the range of supported deployment target versions is 11.0 to 16.1.99.`).
- I can’t really depend on segues because not all of the storyboards have buttons. The ones that do have segues aren’t necessarily going to a specific storyboard - it depends on different variables. So I utilized `self.present()`.
- I would instead try to use `self.navigationController?.pushViewController()` instead. I would do this to be able to move back and forth between the view controllers easier.
