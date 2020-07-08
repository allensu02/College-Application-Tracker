//
//  DateHelper.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/14.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import Foundation

class DateHelper {
    static func convertDateToString (date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_us")
        dateFormatter.setLocalizedDateFormatFromTemplate("yyyyMMdd")
        return dateFormatter.string(from: date)
    }
}
