//
//  CourseHandler.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 27.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import Foundation

class CourseSaver {
    static func giveDirectory() -> String {
        let documentDirectories =
            NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,
                                                FileManager.SearchPathDomainMask.userDomainMask, true)
        
        let documentDirectory = documentDirectories[0]
        let pathWithFileName = "\(documentDirectory)/golf_tracker_courses.txt"

        return pathWithFileName
    }
    
    static func addCourse(data: CourseData) {
        var courses = [] as [CourseData]
        
        if let loadedCourses = self.loadCourses() {
            courses.append(contentsOf: loadedCourses)
        }
        
        courses.append(data)
        
        saveCourses(data: courses)
    }
    
    static func saveCourses(data: [CourseData]) {
        let pathWithFileName = self.giveDirectory()

        do {
           let data = try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false)
           try data.write(to: URL(fileURLWithPath: pathWithFileName))
        } catch {
           NSLog("save error")
        }
    }
    
    static func loadCourses() -> [CourseData]? {
        let pathWithFileName = self.giveDirectory()
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: pathWithFileName))
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [CourseData]
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
