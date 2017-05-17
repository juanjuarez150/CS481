//
//  PassData.swift
//  ParkingHermit
//
//  Created by Juan Juarez on 5/15/17.
//  Copyright © 2017 jdjuarez. All rights reserved.
//

import Foundation
import UIKit


enum PassType: String {  // this is going to tell us what pass types can exist
    case text = "Text"
    case photo = "Photo"
}

class PassData { // this class is for the PassData that will allow us to add the pics and text
    
    let type: PassType
    let date: Date
    
    init ( passType: PassType, creationDate: Date ) {
        type = passType
        date = creationDate
        print ("\(type.rawValue) snippet created at \(date)")
    }
}

class TextData: PassData { //this holds the text data for our PassData
    
    let textData: String
    
    init ( text: String, creationDate: Date ) {
        textData = text
        super.init(passType: .text, creationDate: creationDate)
        print ("Text snippet data: \(textData)")
    }
}

class PhotoData: PassData {
    let photoData: UIImage
    
    init ( photo: UIImage, creationDate: Date )  {
        photoData = photo
        super.init(passType: .photo, creationDate: creationDate)
        print ("Photo snippet data: \(photoData)")
    }
}
