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
    @State var selected = 0
    @State var binders = [String]()
    @State var input : String = ""
    @ObservedObject var play = playState
    var currentScore = 0
    
    func onSetScore() {
        if let num = Int(self.input) {
            play.played[self.selected] = num
            self.selected = self.selected < playState.played.count - 1 ? self.selected + 1 : playState.played.count - 1
        }
        
        self.input = ""
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
            
            HStack {
                Spacer()
                Button(action: {self.selected = self.selected > 0 ? self.selected - 1 : 0}) {
                    Image(systemName: "backward.fill")
                    Text("Prev")
                        .font(.title)
                }
                Text("\(self.selected + 1)")
                    .font(.title)
                
                Button(action: {self.selected = self.selected < playState.played.count - 1 ? self.selected + 1 : playState.played.count - 1}) {
                    Text("Next")
                        .font(.title)
                    Image(systemName: "forward.fill")
                }
                Spacer()
            }
            
            HStack {
                TextField("Enter score",text: $input)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                Button(action: onSetScore) {
                    Text("Set score")
                }                
            }
            
            Divider()
            
            List {
                ForEach(playState.holes.indices, id: \.self) { i in
                    Button(action: {self.selected = i}) {
                        HStack {
                            if i == self.selected {
                                Image(systemName: "arrowtriangle.right.fill")
                            }
                            
                            Text("\(i + 1) - ").fontWeight(i == self.selected ? .bold : .none)
                            Text("Par: \(playState.holes[i]) - ").fontWeight(i == self.selected ? .bold : .none)
                            Text("Score: \(self.play.played[i] != nil ? String(self.play.played[i]!) : "Not played")").fontWeight(i == self.selected ? .bold : .none)
                            }
                    }.padding()
                }
            }
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
    
}

struct CoursePlay_Previews: PreviewProvider {
    static var previews: some View {
        CoursePlay()
    }
}
