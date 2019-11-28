//
//  PlayState.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 28.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import Foundation

var playState = PlayState()

class PlayState: NSObject, NSCoding, ObservableObject{
    @Published var name : String
    @Published var holes : [Int]
    @Published var played : [Int?]
    @Published var isPlaying : Bool
    
    override init() {
        self.name = ""
        self.holes = []
        self.played = []
        self.isPlaying = false
    }
    
    init(name: String, holes: [Int], played: [Int?], isPlaying: Bool) {
        self.name = name
        self.holes = holes
        self.played = played
        self.isPlaying = isPlaying
    }
    
    required init(coder decoder: NSCoder) {
        self.name = decoder.decodeObject(forKey: "name") as! String
        self.holes =  decoder.decodeObject(forKey: "holes") as! [Int]
        self.played = decoder.decodeObject(forKey: "played") as! [Int?]
        self.isPlaying = decoder.decodeBool(forKey: "isPlaying")
    }
    
    func encode(with encoder: NSCoder) {
        encoder.encode(name, forKey: "name")
        encoder.encode(holes, forKey: "holes")
        encoder.encode(played, forKey: "played")
        encoder.encode(isPlaying, forKey: "isPlaying")
    }
}
