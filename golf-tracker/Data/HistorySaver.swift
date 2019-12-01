//
//  HistorySaver.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 1.12.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//
import Foundation

class HistorySaver {
    static func giveDirectory() -> String {
        let documentDirectories =
            NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
                                                FileManager.SearchPathDomainMask.userDomainMask, true)
        
        let documentDirectory = documentDirectories[0]
        let pathWithFileName = "\(documentDirectory)/golf_tracker_history.txt"

        return pathWithFileName
    }
    
    static func addHistory(data: HistoryData) {
        var histories = [] as [HistoryData]
        
        if let loadedHistory = self.loadHistory() {
            histories.append(contentsOf: loadedHistory)
        }
        
        histories.append(data)
        
        saveHistory(data: histories)
    }
    
    static func saveHistory(data: [HistoryData]) {
        let pathWithFileName = self.giveDirectory()

        do {
           let data = try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false)
           try data.write(to: URL(fileURLWithPath: pathWithFileName))
        } catch {
           NSLog("save error")
        }
    }
    
    static func loadHistory() -> [HistoryData]? {
        let pathWithFileName = self.giveDirectory()
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: pathWithFileName))
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [HistoryData]
        } catch {
            NSLog("load error")
        }
        
        return nil
    }
    
    static func removeFile() {
        let path = giveDirectory()
        do {
            try FileManager.default.removeItem(atPath: path)
        } catch let error as NSError {
            
        }
    }
}
