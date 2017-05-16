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

    @IBAction func CreateNewPassPost(_ sender: Any) {
    }

}

