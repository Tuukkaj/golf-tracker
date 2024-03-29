//
//  History.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 21.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import SwiftUI

struct History: View {
    @State var histories = [] as! [HistoryData]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Select history event to inspect it")
                        .foregroundColor(Color.gray)
                    .padding()
                }.padding()

                List {
                    ForEach(histories.indices, id: \.self) { i in
                        HStack {
                            NavigationLink(destination: HistoryInfo(history: self.histories[i])) {
                                Text("\(self.histories[i].name) \(self.histories[i].date)")
                                    .font(.headline)
                            }
                        }
                    }.padding()
                }
            .navigationBarTitle("History")
        }.onAppear(perform: {() in
                if let history = HistorySaver.loadHistory() {
                    self.histories = history
                } else {
                    self.histories = []
                }
            })
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
