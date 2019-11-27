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
            VStack(alignment: .leading) {
                Text("Settings")
                    .font(.title)
                    .fontWeight(.bold)
            }.padding()
            
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
                Button(action: {() in NSLog("Remove history")}) {
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
