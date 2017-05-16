//
//  FirstViewController.swift
//  ParkingHermit
//
//  Created by Juan Juarez on 4/10/17.
//  Copyright © 2017 jdjuarez. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var data: [PassData] = [PassData]() // array of pass data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createNewPass(_ sender: Any) { //create the AlertController which confirms if you want to create a new pass
        
        let alert = UIAlertController(title: "Create New Pass?", message: nil, preferredStyle: .actionSheet)
        let textAction = UIAlertAction(title: "New Pass", style: .default) { (alert: UIAlertAction!) -> Void in
            self.createFullPass()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(textAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion:nil)
        
    }
    
    func createFullPass () {
        guard let textEntryVC = storyboard?.instantiateViewController(withIdentifier: "passEntry") as? PassEntryViewController else {
            print("TextSnippetEntryViewController could not be instantiated from storyboard")
            return
        }
        
        textEntryVC.modalTransitionStyle = .coverVertical
        textEntryVC.saveText = { ( text: String ) in
            let fullPass = TextData(text: text)
            self.data.append(fullPass)
        }
        present(textEntryVC,animated:true, completion:nil)
        
    }
    
    
    @IBAction func LogOutButtonTouch(_ sender: UIButton) {
        
            UserDefaults.standard.set(false,forKey:"isUserLoggedIn");
            UserDefaults.standard.synchronize();
            
            self.performSegue(withIdentifier: "loginView2", sender: self);
        }
    }



