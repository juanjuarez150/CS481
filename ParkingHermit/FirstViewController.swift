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
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var PicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self //delegates itself
        
        PicTableView.estimatedRowHeight = 100
        PicTableView.rowHeight = UITableViewAutomaticDimension
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        PicTableView.reloadData()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createNewPass(_ sender: Any) { //create the AlertController which confirms if you want to create a new pass
        
        let alert = UIAlertController(title: "Creat New Pass?", message: nil, preferredStyle: .actionSheet)
        let textAction = UIAlertAction(title: "Add Details", style: .default) { (alert: UIAlertAction!) -> Void in
            self.createFullPass()
        }
        let photoAction = UIAlertAction(title: "Add Pass Photo", style: .default) { (alert: UIAlertAction!) -> Void in
            self.createNewPhotoSnippet()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(textAction)
        alert.addAction(photoAction)
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
            let fullPass = TextData(text: text, creationDate: NSDate() as Date)
            self.data.append(fullPass)
        }
        present(textEntryVC,animated:true, completion:nil)
        
    }
    
    func createNewPhotoSnippet () {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print ("Camera is not available")
            return
        }
        
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        let sortedData = data.reversed() as [PassData]
        let snippetData = sortedData[indexPath.row]
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy hh:mm a"
        let dateString = formatter.string(from: snippetData.date)
        
        switch snippetData.type
        {
        case .text:
            cell = tableView.dequeueReusableCell(withIdentifier: "textSnippetCell", for: indexPath)
            (cell as! TextSnippetCell).label.text = (snippetData as! TextData).textData
            (cell as! TextSnippetCell).date.text = dateString
            
        case .photo:
            cell = tableView.dequeueReusableCell(withIdentifier: "photoSnippetCell", for: indexPath)
            (cell as! PhotoSnippetCell).photo.image = (snippetData as! PhotoData).photoData
        }
        
        return cell
    }
    
    
    @IBAction func LogOutButtonTouch(_ sender: UIButton) {
        
            UserDefaults.standard.set(false,forKey:"isUserLoggedIn");
            UserDefaults.standard.synchronize();
            
            self.performSegue(withIdentifier: "loginView2", sender: self);
        }
    
}

extension FirstViewController: UITableViewDataSource {
    
}


extension FirstViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
            print("Image could not be found")
            return
        }
        
        let newPhotoSnippet = PhotoData(photo: image, creationDate: Date())
        self.data.append(newPhotoSnippet)
        
        dismiss(animated: true, completion: nil)
    }
    
}



