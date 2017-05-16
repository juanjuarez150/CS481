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
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.inputAccessoryView = createKeyboardToolbar()
        textView.becomeFirstResponder()
        imagePicker.delegate = self
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
        self.createNewPhotoSnippet()
    }

   /* @IBAction func addImage(_ sender: Any) {
        
        self.createNewPhotoSnippet()
        
        } */

    func createNewPhotoSnippet () {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print ("Camera is not available")
            return
        }
        
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }

    
}

extension PassEntryViewController : UITextViewDelegate { //this saves the text
        func textViewDidEndEditing(_ textView: UITextView) {
            saveText(textView.text)
            
            dismiss(animated: true, completion: nil)
        }
}

extension PassEntryViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
            guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
                print("Image could not be found")
                return
            }
            
      //      let newPhotoSnippet = PhotoData(photo: image)
      //      self.data.append(newPhotoSnippet)
            
            dismiss(animated: true, completion: nil)
        }
        
    }


