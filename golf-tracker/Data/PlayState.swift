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
    
    func load() {
        let defaultDB = UserDefaults.standard
        let tempData = defaultDB.object(forKey: "playState") as? Data
        
        NSLog("Starting...")
        if let data = tempData {
            NSLog("Starting... found")
            do {
                let temp = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! PlayState
                NSLog("\(temp.isPlaying)")
                playState.name = temp.name
                playState.holes = temp.holes
                playState.played = temp.played
                playState.isPlaying = temp.isPlaying
            } catch {
                NSLog("Error loading state")
            }
        }
    }
    
    func save() {
        let defaultDB = UserDefaults.standard
        
        NSLog("Saving...")
        do {
            let data : Data = try NSKeyedArchiver.archivedData(withRootObject: playState, requiringSecureCoding: false)
            defaultDB.set(data, forKey: "playState")
            defaultDB.synchronize()
        } catch {
            NSLog("Error saving state")
        }
    }
}
