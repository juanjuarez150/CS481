//
//  FourthViewController.swift
//  ParkingHermit
//
//  Created by Juan Juarez on 4/10/17.
//  Copyright © 2017 jdjuarez. All rights reserved.
//

import UIKit
import MessageUI

class FourthViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var txtMessage: UITextField!
    @IBOutlet weak var contactTxt: UITextField!
    @IBOutlet weak var txtLabel: UILabel!
    
    @IBAction func SendMessage(_ sender: Any) {
        if MFMessageComposeViewController.canSendText() {
            let control = MFMessageComposeViewController()
            control.body = self.txtMessage.text
            control.recipients = [self.contactTxt.text!]
            self.present(control, animated: true, completion: nil)
            
 
        }
      
            let text1 = txtMessage.text
            txtLabel.text = text1
            txtMessage.text = ""
    }

    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

