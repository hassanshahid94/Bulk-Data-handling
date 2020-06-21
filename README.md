# Bulk Data handling iOS Task


#### System Architecture:
This application was developed on Xcode IDE. Xcode is used for creating native iOS, watchOS, tvOS applications. Xcode does not generate the code for any application. Developer has to design the screens first and then connect the code with the design.

**MVC** design pattern was used in the application. This application is developed on Swift language. Let me explain a little about the MVC approach I used. As MVC is Model-View-Controller, I organized the app in this way:

**Models:**
1. LoginResponse (Get the access token for calling further apis)
2. StationsListReponse (Array of Stations)
3. StationDetail 

**Views:**
1. Main.storyboard (where I have the UI Views designed)

**Controllers:**
1. FakeLaunchScreenVC (App first intro screen where I checked the cache value if exsit then i will goto Stations list Screen, otherwise I will open Login Screen)
2. LoginVC (From which we can login into the application)
3. StationsVC (Where  the best 10 nearest stations are shown from your current location)
4. StationDetailVC (where the detail of the specific station are shown)

**File Naming Conventions:**

* **VC** are ViewControllers
* **CCell** are CollectionViewCells
* **TCell** are TableViewCells

There is another folder in the app:

**Helpers:**
1. **Constants** (constants used in the app such as URLs)
2. **Extensions** (useful feature that helps in adding more functionality to an existing Class and written one time to access anywhere)
3. **ServerManager** (API calls)
4. **Globals** (Use to access the global variables)

App images are places in **Assets.xcassets** folder


### Cocoapods:

Virta iOS Task uses a number of open source 3rd Party Libraries to for better user experience:

* [MBProgressHUD](https://github.com/jdg/MBProgressHUD) - Custom Activity Indicator(Loader/Spinner)
* [IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager) - Used to prevent issues of keyboard sliding up and cover UITextField/UITextView.
* [Alamofire](https://github.com/Alamofire/Alamofire) - An HTTP networking library.
* [LoadingPlaceholderView](https://github.com/MarioIannotta/LoadingPlaceholderView) - Non-blocking animated gradient placeholder for tableview for your async tasks.

### Support:
In case of any errors or app crashes please email me at:

Hassan Shahid ( [hassan .shahid94@yahoo.com](hassan.shahid94@yahoo.com) )


----


**Last Updated: 27.04.2020**
