//
//  Courses.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 21.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import SwiftUI

struct Courses: View {
    @ObservedObject var courses = ObservedCourses()
    @ObservedObject var state : PlayState
    
    init() {
        state = playState
    }
    
    func delete(at offsets: IndexSet) {
        courses.courses.remove(atOffsets: offsets)
        CourseSaver.saveCourses(data: courses.courses)
    }
    
    func updateCourses() {
        if let loaded = CourseSaver.loadCourses() {
            courses.courses = loaded
        } else {
            courses.courses = []
        }
    }
    
    var body: some View {
        VStack {
            if playState.isPlaying {
                Button("Disable play") {
                    playState.isPlaying = false
                }
            } else {
                Button("Enable play") {
                    playState.isPlaying = true
                }
                
                NavigationView {
                    VStack(alignment: .leading){
                        NavigationLink(destination: AddCourse(updateMainView: updateCourses)) {
                            Text("Add course")
                            Image(systemName:"plus")
                        }.padding()
                        
                        if courses.courses.count > 0 {
                            List {
                                ForEach(courses.courses.indices, id: \.self) { i in
                                    HStack {
                                        NavigationLink(destination: CourseInfo(course: self.courses.courses[i])) {
                                            Text("\(self.courses.courses[i].name)")
                                        }
                                    }.padding()
                                    
                                }.onDelete(perform: delete)
                            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                        } else {
                            
                                Text("No courses added yet")
                                                .font(.headline)
                                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                                                .padding()
                        }
                    }.padding()
                
                    .navigationBarTitle("Courses")
                }.onAppear(perform: updateCourses)
            }
        }
    }
}

struct Courses_Previews: PreviewProvider {
    static var previews: some View {
        Courses()
    }
}
