//
//  HistoryData.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 1.12.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import Foundation

class HistoryData: NSObject, NSCoding {
    var name : String
    var holes : [Int]
    var played : [Int]
    var dateAndTime : String
    
    init(name: String, holes: [Int], played : [Int], dateAndTime : String) {
        self.name = name
        self.holes = holes
        self.played = played
        self.dateAndTime = dateAndTime
    }
    
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as! String
        self.holes =  decoder.decodeObject(forKey: "holes") as! [Int]
        self.played =  decoder.decodeObject(forKey: "played") as! [Int]
        self.dateAndTime = decoder.decodeObject(forKey: "dateAndTime") as! String
    }
    
    func encode(with encoder: NSCoder) {
        encoder.encode(name, forKey: "name")
        encoder.encode(holes, forKey: "holes")
        encoder.encode(played, forKey: "played")
        encoder.encode(dateAndTime, forKey: "dateAndTime")
    }
}

