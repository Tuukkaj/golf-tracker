//
//  Course.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 27.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import Foundation

class Course: NSObject, NSCoding {
    var name : String
    var holes : [Int]
    
    init(name: String, holes: [Int]) {
        self.name = name
        self.holes = holes
    }
    
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as! String
        self.holes =  decoder.decodeObject(forKey: "holes") as! [Int]
    }
    
    func encode(with encoder: NSCoder) {
        encoder.encode(name, forKey: "name")
        encoder.encode(holes, forKey: "holes")
    }
}
