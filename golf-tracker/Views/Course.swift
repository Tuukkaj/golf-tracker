//
//  Course.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 27.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import SwiftUI

struct Course: View {
    var course : CourseData
    
    var body: some View {
        var par = 0
        
        for hole in course.holes {
            par += hole
        }
        
        return VStack(alignment: .leading) {
            HStack {
                Text("Par: \(par)")
                    .font(.headline)
                Spacer()
            }.padding()
            
            List {
                ForEach(course.holes.indices) { i in
                    Text("Hole: \(i + 1) - Par \(self.course.holes[i])")
                }
            }
                        
            HStack {
                Spacer()
                Button(action: {() in NSLog("Play pressed")}) {
                    Text("Play course").font(.title)
                    Image(systemName: "play")
                }
                Spacer()
            }

            
        .navigationBarTitle(course.name)
        }
    }
}

struct Course_Previews: PreviewProvider {
    static var previews: some View {
        Course(course: CourseData(name: "Jaskan reikä",holes: [2,3,5,3,3,3,5]))
    }
}
