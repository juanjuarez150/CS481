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

    @IBAction func createNewPass(_ sender: Any) {
        
        let alert = UIAlertController(title: "Create New Pass?", message: nil, preferredStyle: .actionSheet)
        let textAction = UIAlertAction(title: "New Pass", style: .default) { (alert: UIAlertAction!) -> Void in
            self.data.append(PassData(passType: .text))
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(textAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion:nil)
        
    }


}

