//
//  Settings.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 27.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        
            
            Divider()
            
            HStack {
                Text("Remove courses data")
                    .font(.headline)
                Spacer()
                Button(action: {() in CourseSaver.removeFile()}) {
                    Image(systemName: "trash")
                }
            }.padding()
            HStack {
                Text("Remove history data")
                    .font(.headline)
                Spacer()
                Button(action: {() in HistorySaver.removeFile()}) {
                    Image(systemName: "trash")
                }
            }.padding()
            
            Spacer()
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
