//
//  InProgressCollege.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/20.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation

class InProgressCollege: College {
    
    var deadline: String!
    var priority: String!
    
    init(name: String, major: String, type: String, tier: String, deadline: String, priority: String, docID: String) {
        super.init(name: name, major: major, type: type, tier: tier, docID: docID)
        self.deadline = deadline
        self.priority = priority
    }
}
