//
//  LoginViewController.swift
//  ParkingHermit
//
//  Created by So Cal on 5/16/17.
//  Copyright © 2017 jdjuarez. All rights reserved.
//

import UIKit



class LoginViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var userpasswordtext: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTouched(_ sender: UIButton) {
 
        let currentUsername = UserDefaults.standard.string(forKey: "usernameR");
        let currentPassword = UserDefaults.standard.string(forKey: "passwordR");
        
        let username = usernameText.text
        let userPassword = userpasswordtext.text
        
    
 
        
        if (currentUsername==username)
        {
           if (currentPassword==userPassword)
            {
                UserDefaults.standard.set(true,forKey:"isUserLoggedIn");
                UserDefaults.standard.synchronize();
                
                self.dismiss(animated: true, completion:nil);
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
