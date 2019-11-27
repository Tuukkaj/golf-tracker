//
//  ContentView.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 21.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Courses()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Courses")
                }.tag(0)
            History()
                .tabItem {
                    Image(systemName: "stopwatch")
                    Text("History")
                }.tag(1)
            Settings()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
