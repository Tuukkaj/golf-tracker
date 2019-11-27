//
//  ObservedCourses.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 27.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import Foundation

class ObservedCourses: ObservableObject {
    @Published var courses = [] as [Course]
}
