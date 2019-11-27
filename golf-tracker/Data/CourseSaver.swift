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
    
    static func addCourse(data: Course) {
        var courses = [] as [Course]
        
        if let loadedCourses = self.loadCourses() {
            courses.append(contentsOf: loadedCourses)
        }
        
        courses.append(data)
        
        saveCourses(data: courses)
    }
    
    static func saveCourses(data: [Course]) {
        let pathWithFileName = self.giveDirectory()

        do {
           let data = try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false)
           try data.write(to: URL(fileURLWithPath: pathWithFileName))
        } catch {
           NSLog("save error")
        }
    }
    
    static func loadCourses() -> [Course]? {
        let pathWithFileName = self.giveDirectory()
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: pathWithFileName))
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Course]
        } catch {
            NSLog("load error")
        }
        
        return nil
    }
}
