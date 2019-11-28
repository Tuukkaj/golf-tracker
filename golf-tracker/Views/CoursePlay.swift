//
//  CoursePlay.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 28.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import SwiftUI

struct CoursePlay: View {
    @State var totalPar = 0
    var currentScore = 0
    
    func updateScores() {
        
    }
    var body: some View {
        var currentScore = 0
        
        for i in 0..<playState.holes.count {
            let holePar = playState.holes[i]
            if let score = playState.played[i] {
                currentScore += holePar - score
            }
        }
        
        return VStack(alignment: .leading)  {
            Button(action: {
                playState.isPlaying = false
            }) {
                Text("Stop playing")
                Image(systemName: "multiply")
            }
            Text(playState.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Divider()
            Text("Course par: \(totalPar)")
            Text("Score: \(totalPar)")
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
    
}

struct CoursePlay_Previews: PreviewProvider {
    static var previews: some View {
        CoursePlay()
    }
}
