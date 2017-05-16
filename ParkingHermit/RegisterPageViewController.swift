//
//  RegisterPageViewController.swift
//  ParkingHermit
//
//  Created by So Cal on 5/16/17.
//  Copyright © 2017 jdjuarez. All rights reserved.
//

import UIKit



class RegisterPageViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var userPasswordText: UITextField!
    
    @IBOutlet weak var confirmPasswordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func RegisterButtonClicked(_ sender: UIButton) {
        
        let username = usernameText.text
        let userpassword = userPasswordText.text
        let confirmPassword = confirmPasswordText.text
        

        if (username?.isEmpty)! || (userpassword?.isEmpty)!||(confirmPassword?.isEmpty)!
        {
            alertMessage (userMessage: "Enter all Information")
            return;
        }
        
        if (userpassword != confirmPassword)
        {
            alertMessage (userMessage: "Do Not Match")
            return;

        }
        //Save user info
        UserDefaults.standard.setValue(username,forKey: "usernameR")
        UserDefaults.standard.setValue(userpassword,forKey: "passwordR")
        UserDefaults.standard.set(true,forKey:"isUserLoggedIn")
        UserDefaults.standard.synchronize()



            
            //println("User successfully registered")
            
            // Display alert message with confirmation.
            var myAlert = UIAlertController(title:"Alert", message:"Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.alert);
            
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default){ action in
                self.dismiss(animated: true, completion:nil);}

            myAlert.addAction(okAction)
            self.present(myAlert, animated:true, completion:nil);
            
            
 
        
        }
    
    
    func alertMessage (userMessage:String)
    {
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated:true, completion:nil);
    }



    func GoBackToLogin(_ sender: UIButton) {
                self.dismiss(animated: true, completion: nil)
    }
    


    
}
