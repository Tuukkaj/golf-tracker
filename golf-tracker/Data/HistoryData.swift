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
    var date : String
    var time : String
    
    init(name: String, holes: [Int], played : [Int], date : String, time: String) {
        self.name = name
        self.holes = holes
        self.played = played
        self.date = date
        self.time = time
    }
    
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as! String
        self.holes =  decoder.decodeObject(forKey: "holes") as! [Int]
        self.played =  decoder.decodeObject(forKey: "played") as! [Int]
        self.date = decoder.decodeObject(forKey: "date") as! String
        self.time = decoder.decodeObject(forKey: "time") as! String
    }
    
    func encode(with encoder: NSCoder) {
        encoder.encode(name, forKey: "name")
        encoder.encode(holes, forKey: "holes")
        encoder.encode(played, forKey: "played")
        encoder.encode(date, forKey: "date")
        encoder.encode(time, forKey: "time")
    }
}

