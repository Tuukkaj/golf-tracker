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
        Text("Hello, World!")
    }
}

struct HistoryInfo_Previews: PreviewProvider {
    static var previews: some View {
        HistoryInfo(history: HistoryData(name: "Jaska's golf cours", holes: [3,3,3], played: [4,2,3], date: "01.12.2019", time: "14-15"))
    }
}
