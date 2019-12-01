//
//  HistoryInfo.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 1.12.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import SwiftUI

struct HistoryInfo: View {
    var history : HistoryData
    
    var body: some View {
        var currentScore = 0
        var coursePar = 0
        
        for i in 0..<playState.holes.count {
            let holePar = playState.holes[i]
            coursePar += holePar
            
            if let score = playState.played[i] {
                currentScore += score - holePar
            }
        }
        
        return VStack {
            Text(history.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("\(history.date) \(history.time)")
                .font(.title)
                .padding()
            
                Text("Par \(coursePar)")
                    .padding()
            
                Text("Score \(currentScore)")
                    .padding()
            
            List {
                ForEach(history.holes.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text("Hole \(index + 1)")
                        .fontWeight(.bold)
                        Text("Par \(self.history.holes[index])")
                        Text("Played \(self.history.played[index])")
                    }.padding()
                }
            }
        }
    }
}

struct HistoryInfo_Previews: PreviewProvider {
    static var previews: some View {
        Text("Not in use")
    }
}
