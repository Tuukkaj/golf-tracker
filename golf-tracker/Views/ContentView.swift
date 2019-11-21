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
                    Image(systemName: "1.circle")
                    Text("First")
                }.tag(0)
            History()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
