//
//  ViewController.swift
//  Test
//
//  Created by nixnoughtnothing on 5/17/15.
//  Copyright (c) 2015 Sttir Inc. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ViewController: UIViewController,PFLogInViewControllerDelegate,PFSignUpViewControllerDelegate{
    
    var logInViewController:PFLogInViewController! = PFLogInViewController()
    var signUpViewController:PFSignUpViewController! = PFSignUpViewController()
    
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var logOutButton: UIButton!
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // before logged in
        if PFUser.currentUser() == nil{
            self.logInViewController.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.LogInButton | PFLogInFields.SignUpButton | PFLogInFields.PasswordForgotten | PFLogInFields.DismissButton | PFLogInFields.Facebook | PFLogInFields.Twitter
            
            
            var logInLogoTitle = UILabel()
            logInLogoTitle.text = "Log In"
            self.logInViewController.logInView!.logo = logInLogoTitle
            self.logInViewController.delegate = self
            
            
            var signUpLogoTitle = UILabel()
            signUpLogoTitle.text = "Sign Up"
            self.signUpViewController.signUpView!.logo = signUpLogoTitle
            
            self.signUpViewController.delegate = self
            
            self.logInViewController.signUpController = self.signUpViewController
            
            
            self.logOutButton.hidden = true
            
        }
        
        let logoView = UIImageView(image: UIImage(named: "test_logo.png"))
        logoView.layer.position = CGPoint(x:self.view.bounds.width/2, y:self.view.bounds.height/2)
        self.view.addSubview(logoView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
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
        // twitter nameをusernameにする
        if (PFTwitterUtils.isLinkedWithUser(user)){
            var twitterUsername = PFTwitterUtils.twitter()?.screenName
            PFUser.currentUser()?.username = twitterUsername
            PFUser.currentUser()?.saveEventually(nil)
        }
        
        // Todo: facebook name をusernameにする
        //        if (PFFacebookUtils.isLinkedWithUser(user)){
        //            var request =
        //        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.logOutButton.hidden = false
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        println("failed to login")
        println("\(error)")
    }
    
    // MARK: Sing Up Actions
    func signUpViewController(signUpController: PFSignUpViewController, shouldBeginSignUp info: [NSObject : AnyObject]) -> Bool {
        
        return true
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        // twitter nameをusernameにする
        if (PFTwitterUtils.isLinkedWithUser(user)){
            var twitterUsername = PFTwitterUtils.twitter()?.screenName
            PFUser.currentUser()?.username = twitterUsername
            PFUser.currentUser()?.saveEventually(nil)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
        self.logOutButton.hidden = false
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        println("failed to sign up")
        println("\(error)")
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        println("User dismissed sign up")
    }

    // MARK: Actions
    @IBAction func logOutButtonTapped(sender: AnyObject) {
        PFUser.logOut()
        self.logOutButton.hidden = true
    }
    @IBAction func segmentedAction(sender: AnyObject) {
        if (segmented.selectedSegmentIndex == 0) {
            self.presentViewController(signUpViewController, animated: true, completion: nil)
        } else if(segmented.selectedSegmentIndex == 1) {
            self.presentViewController(logInViewController, animated: true, completion: nil)
        }
    }
}

