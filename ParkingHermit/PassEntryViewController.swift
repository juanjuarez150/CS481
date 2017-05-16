//
//  PassEntryViewController.swift
//  ParkingHermit
//
//  Created by Juan Juarez on 5/15/17.
//  Copyright © 2017 jdjuarez. All rights reserved.
//

import Foundation
import UIKit
class PassEntryViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var saveText: (_ text: String) -> Void = { (text:String) in }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.inputAccessoryView = createKeyboardToolbar()
        textView.becomeFirstResponder()
    }
    
    func createKeyboardToolbar () -> UIView { //creates the keyboard
        let keyboardToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
        keyboardToolbar.setItems([flexSpace, doneButton], animated: false)
        
        return keyboardToolbar
    }
    
    func doneButtonPressed() { // implements the done button
        textView.resignFirstResponder()
    }

}

extension PassEntryViewController : UITextViewDelegate { //this saves the text
        func textViewDidEndEditing(_ textView: UITextView) {
            saveText(textView.text)
            dismiss(animated: true, completion: nil)
        }
    }
