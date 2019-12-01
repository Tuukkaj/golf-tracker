//
//  History.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 21.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import SwiftUI

struct History: View {
    init() {
        if let history = HistorySaver.loadHistory() {
            NSLog("\(history)")
        }
    }

    var body: some View {
        VStack {
            Text("History")
        }.onAppear(perform: {() in
            if let history = HistorySaver.loadHistory() {
                NSLog("\(history)")
            }
        })
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
