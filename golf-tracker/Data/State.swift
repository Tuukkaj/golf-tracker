//
//  State.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 28.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import Foundation

var appState = AppState()

class AppState: ObservableObject  {
    @Published var isPlaying = false
}

// MARK: - State restoration

extension AppState {
    
    func restore(from activity: NSUserActivity) {
        guard activity.activityType == Bundle.main.activityType,
            let isPlaying = activity.userInfo?[Key.isPlaying] as? Bool
            else { return }
        
        self.isPlaying = isPlaying
    }
    
    func store(in activity: NSUserActivity) {
        activity.addUserInfoEntries(from: [Key.isPlaying: isPlaying])
    }
    
    private enum Key {
        static let isPlaying = "isPlaying"
    }
}
