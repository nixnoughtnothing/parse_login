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
```Swift
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

[4] Create Login and Signup views

* Go to `ViewController.swift`
* import Parse
* import ParseUI
* List the superclass names(PFLogInViewControllerDelegate,PFSignUpViewControllerDelegate) before any protocols it adopts, followed by a comma:

  e.g.
  **ViewController.swift**
  ```Swift
  class ViewController: UIViewController,PFLogInViewControllerDelegate,PFSignUpViewControllerDelegate{
      // class definition goes here 
  }
  ```
  
* Declare and initialize 2 new Properties in ViewController.swift

  e.g.
  ```Swift
  var logInViewController:PFLogInViewController! = PFLogInViewController()
  var singUpViewController: PFSignUpViewController! = PFSignUpViewController()
  ```
   
* Add Login Methods in ViewController.swift
  ```Swift
  // MARK: Parse LogIn

  func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool{
    return true
  }
  
  func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
  }
    
  func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
  }
  ```
  
* Add SignUp Methods 
  ```Swift
  
  // MARK: Parse Sign Up
  
  func signUpViewController(signUpController: PFSignUpViewController, shouldBeginSignUp info: [NSObject : AnyObject]) -> Bool {
    return true
  }
    
  func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
  }
    
  func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
  }
    
  func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
  }
  ```
  
* override ViewDidAppear Method, create LogIn/SignUp Views
  
  e.g.

  **ViewController.swift**
  ```Swift
  
  override func viewDidApper(animated:Bool){
      super.viewDidApper(animated)
     
      // if currentUser is NOT logged in
      if (PFUser.currentUser() == nil){
     
        /** present login View **/
        // set login view fields
        self.logInViewController.fields = PFLogInFields.UsernameAndPassword | PFLoginFields.LogInButton  |
        PFLogInFields.SignUpButton | PFLogInFields.PasswordForgotten | PFLogInFields.DismissButton
         
        // set login view title
        var logInLogoTitle = UILabel()
        LogInLogoTitle.text = "Test(Swift App)"
        self.logInViewController.logInView.logo = logoInLogoTitle

        // set delegate
        self.logInViewController.delegate = self

        /** present signup View **/
        var signUpLogoTitle = UILabel()
        signUpLogoTItle.text = "SignUp Test"
        self.signUpViewController.signUpView.logo = signUpLogoTitle
         
        // set delegate
        self.signUpViewController.delegate = self
        
        self.logInViewController.SignUpViewController = self.signUpViewController
      }
  }
  ```
  
  * implement singup/login methods
  
  **ViewController.swift**

  **Log In**
  ```Swift
  // MARK: logIn Actions
    
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        
        if (!username.isEmpty || !password.isEmpty){
            return true
        }else{
            var alert = UIAlertView(title: "username or password is not entered", message: "please enter", delegate: self, cancelButtonTitle: "OK")
            return false
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        println("failed to login: \(error)")
    }
  ```
  
  **Sign Up**
  ```Swift
    // MARK: Parse Sign Up
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        println("failed to sign up: \(error)")
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        println("User dismissed sign up")
    }
  ```

[5] Put Login/Signup Button

* Go to Storyboard then, Add two buttons on your ViewController
* Link these Buttons to ViewController.swift code

e.g.
**ViewController.swift**
```Swift
// MARK: Actions
    
@IBAction func signUpButtonPushed(sender: AnyObject){
     self.presentViewController(signUpViewController,animated:true, completion:nil)
}


@IBAction func logInButtonPushed(sender: AnyObject){
     self.presentViewController(logInViewController.Animated:true,completion:nil)
}
```

[6] LogOut Button  

######  coming soon  

[7] Facebook and Twitter login  

######  coming soon  
