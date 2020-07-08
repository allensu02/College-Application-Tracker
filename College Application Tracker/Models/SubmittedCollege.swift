//
//  SubmittedCollege.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/20.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation

class SubmittedCollege: College {
    var decisionRelease: String!
    var submittedDate: String!
    
    init(name: String, major: String, type: String, tier: String, submittedDate: String, decisionRelease: String, docID: String) {
        super.init(name: name, major: major, type: type, tier: tier, docID: docID)
        self.submittedDate = submittedDate
        self.decisionRelease = decisionRelease
    }
}
