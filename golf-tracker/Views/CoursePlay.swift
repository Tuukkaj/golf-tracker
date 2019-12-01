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
    @State var complete = false
    @State var dateInput = ""
    @State var timeInput = ""
    @ObservedObject var play = playState
    
    var currentScore = 0
    
    func saveCourse() {
        HistorySaver.addHistory(data: HistoryData(name: playState.name, holes: playState.holes, played: playState.played as! [Int], date: dateInput, time: timeInput))
        playState.clearAndSave()
    }
    
    func onSetScore() {
        if let num = Int(self.input) {
            play.played[self.selected] = num
            self.selected = self.selected < playState.played.count - 1 ? self.selected + 1 : playState.played.count - 1
            playState.save()
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
            if self.complete {
                VStack {
                    HStack {
                        Button(action: {
                            self.complete = false
                        }) {
                            Image(systemName: "arrow.left")
                            Text("Back")
                        }
                        
                        Spacer()
                    }.padding()
                    
                    Spacer()
                    
                    Text("Enter time information")
                        .font(.largeTitle)
                    Text("This information will be displayed in history")

                    Divider()
                    
                    HStack {
                        Text("Date")
                            .font(.title).padding()
                        TextField("Date when course was played", text: $dateInput)
                    }.padding()

                    HStack {
                        Text("Time")
                            .font(.title).padding()
                        TextField("Time from and to when played", text: $timeInput)
                    }.padding()
                    
                    Button(action: saveCourse) {
                        Text("Save course")
                            .font(.title)
                        Image(systemName: "plus")
                    }
                    
                    Spacer()
                }
            } else {
                VStack {
                    HStack {
                            Button(action: {
                                playState.isPlaying = false
                                playState.save()
                            }) {
                                Text("Stop playing")
                                Image(systemName: "multiply")
                            }
                            Spacer()
                            Button(action: {
                                self.complete = true
                                playState.save()
                            }) {
                                Text("Finish round")
                                Image(systemName: "checkmark")
                            }.disabled(playState.played.contains(nil))
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
            
            
    }
    
}

struct CoursePlay_Previews: PreviewProvider {
    static var previews: some View {
        CoursePlay()
    }
}
