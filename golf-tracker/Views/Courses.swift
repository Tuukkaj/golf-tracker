//
//  Courses.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 21.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import SwiftUI

struct Courses: View {
    init() {
        if var courses = CourseSaver.loadCourses() {
            NSLog(String(describing: courses))
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                NavigationLink(destination: AddCourse()) {
                    Text("Add course")
                    Image(systemName:"plus")
                }
                 Text("Courses")
                
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }.padding()
           

            .navigationBarTitle("Courses")
        }
    }
}

struct Courses_Previews: PreviewProvider {
    static var previews: some View {
        Courses()
    }
}
