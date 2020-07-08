//
//  College.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/20.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation

class College {
    var collegeName: String
    var major: String
    var type: String
    var tier: String
    var docID: String
    init(name: String, major: String, type: String, tier: String, docID: String) {
        self.collegeName = name
        self.major = major
        self.type = type
        self.tier = tier
        self.docID = docID
    }
}
