//
//  SecondViewController.swift
//  ParkingHermit
//
//  Created by Juan Juarez on 4/10/17.
//  Copyright © 2017 jdjuarez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell 
        
        let sortedData = data.reversed() as [SnippetData]
        let snippetData = sortedData[indexPath.row]
        
        switch snippetData.type
        {
        case .text:
            cell = tableView.dequeueReusableCell(withIdentifier: "textSnippetCell", for: indexPath)
            (cell as! TextCell).label.text = (snippetData as! TextData).textData
            
        case .photo:
            cell = tableView.dequeueReusableCell(withIdentifier: "photoSnippetCell", for: indexPath)
            (cell as! PhotoCell).photo.image = (snippetData as! PhotoData).photoData
        }
        
        return cell
    }
    
}

extension SecondViewController: UITableViewDataSource {
    
}

