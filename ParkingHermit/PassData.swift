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

struct PassData {
    
    let type: PassType
    
    init ( passType: PassType ) {
        type = passType
        print ("\(type.rawValue) pass created")
    }
    
}
