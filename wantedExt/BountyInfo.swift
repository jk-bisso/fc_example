//
//  BountyInfo.swift
//  wantedExt
//
//  Created by JK-PC on 21/05/2019.
//  Copyright © 2019 JK-PC. All rights reserved.
//

import UIKit

class BountyInfo: NSObject {
    var name: String
    var bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
