# Parse_login
The easiest way to login,signup,facebook and twitter login using Parse

## Demo
######  More details Coming Soon!

## Development environment
* Mac OS X 10.10.3 Yosemite  
* XCode 6.3  
* Swift 1.2  

## Tutorial

[1]  Create New Project in XCode6

* Choose Single View Application
* Select Language -> Swift

[2] Prepare libraries / Dependencies
* Go to [Parse.com](https://parse.com/)
* Go to DashBoard(if you don't have Parce.com account, you need to sign up first.)
* Create a New App with a name
* Click QuickStartGuide → Data → Mobile → iOS → Swift → Existing Project
* Download the SDK then Open up the folder
* Go back to XCode, Click "Build Phrases" → "Link Binary With Libraries"  
  
  From Parse SDK folder,  
      Add "Bolts.framework","Parse.framework","ParseUI.framework" by drag and drop    

  Then,  
  Click the + button in the bottom left of the "Link Binary With Libraries" section and add the following libraries  
      
      "AudioToolbox.framework"  
      "CFNetwork.framework"  
      "CoreGraphics.framework"  
      "CoreLocation.framework"  
      "MobileCoreServices.framework"  
      "QuartzCore.framework"  
      "Security.framework"  
      "StoreKit.framework"  
      "SystemConfiguration.framework"  
      "libz.dylib"  
      "libsqlite3.dylib"  
      "Accounts.framework"  
      "Social.framework"  
      
* Create "Framework directory" and then,drag and drog the frameworks you added.

[3]  Integrate Parse into your project

①Go to AppDelegate.swift  
②import Parse   
②set your Parse ID and Client Key  

e.g.

**AppDelegate.swift**
```
import UIKit
import Parse // ①import Parse Library


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // ②Add the line below and Set your parse ID and Client Key(check them on Parse.com,then copy and paste here)
        Parse.setApplicationId("your parse ID", clientKey: "your client Key")
        
        return true
    }
}
```
