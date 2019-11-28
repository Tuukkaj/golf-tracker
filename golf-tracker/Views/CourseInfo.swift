//
//  Course.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 27.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import SwiftUI

struct CourseInfo: View {
    var course : CourseData
    
    var body: some View {
        var par = 0
        
        for hole in course.holes {
            par += hole
        }
        
        return VStack(alignment: .leading) {
            if playState.isPlaying {
                Text("Play screen")
            } else {
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
                    Button(action: {
                        playState.isPlaying = true
                        playState.holes = self.course.holes
                        playState.played = [Int?](repeating: nil, count: playState.holes.count)
                        playState.name = self.course.name
                        
                        playState.save()
                    }) {
                        Text("Play course").font(.title)
                        Image(systemName: "play")
                    }.padding()
                    Spacer()
                }
                
                .navigationBarTitle(course.name)
            }
        }
    }
}

struct CourseInfo_Previews: PreviewProvider {
    static var previews: some View {
        CourseInfo(course: CourseData(name: "Jaskan reikä",holes: [2,3,5,3,3,3,5]))
    }
}
