//
//  PassData.swift
//  ParkingHermit
//
//  Created by Juan Juarez on 5/15/17.
//  Copyright © 2017 jdjuarez. All rights reserved.
//

import Foundation

enum PassType: String {  // this is going to tell us what pass types can exist
    case text = "Text"
    case photo = "Photo"
}

class PassData { // this class is for the PassData that will allow us to add the pics and text
    
    let type: PassType
    
    init ( passType: PassType ) {
        type = passType
        print ("\(type.rawValue) pass created")
    }
}

class TextData: PassData { //this holds the text data for our PassData
    
    let textData: String
        
        init ( text: String ) {
            textData = text
            super.init(passType: .text)
            print ("Text snippet data: \(textData)")
        }
    }
