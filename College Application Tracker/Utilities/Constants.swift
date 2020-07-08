//
//  Constants.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/13.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

enum ApplicationType: String, CaseIterable {
    case regularDecision = "Regular Decision"
    case earlyDecision = "Early Decision"
    case earlyAction = "Early Action"
    case restrictiveEarlyAction = "Restrictive EA"
    
}

enum CollegeTier: CaseIterable {
    case dream
    case reach
    case target
    case safety
}

enum Priority: CaseIterable {
    case critical
    case high
    case medium
    case low
}

var inProgressColleges: [InProgressCollege] = []
var submittedColleges: [SubmittedCollege] = []

enum ScreenSize {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
}

enum DeviceType {
    static let idiom = UIDevice.current.userInterfaceIdiom
    static let nativeScale = UIScreen.main.nativeScale
    static let scale = UIScreen.main.scale
    
    static let isiPhoneSE = idiom == .phone && ScreenSize.maxLength == 568.0
    static let isiPhone8Standard = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    static let isiPhone8Zoomed  = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
    static let isiPhone8PlusStandard = idiom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone8PlusZoomed = idiom == .phone && ScreenSize.maxLength == 736.0 && nativeScale < scale
    static let isiPhoneX = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhoneXsMaxAndXrAnd11ProAndMax = idiom == .phone && ScreenSize.maxLength == 896.0
    static let isiPad = idiom == .phone && ScreenSize.maxLength == 1024.0

    static func isiPhoneXAspectRation() -> Bool {
        return isiPhoneX || isiPhoneXsMaxAndXrAnd11ProAndMax
    }
}

enum PriorityIcons {
    static let high = UIImage(systemName: "arrowtriangle.up.fill")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
    static let low = UIImage(systemName: "arrowtriangle.down.fill")!.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
    static let medium = UIImage(systemName: "circle.fill")!.withTintColor(.systemOrange, renderingMode: .alwaysOriginal)
    static let critical = UIImage(systemName: "exclamationmark.octagon.fill")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)

}

enum Colors {
    static let lightGreen = UIColor(red: 145/255, green: 212/255, blue: 194/255, alpha: 1)
    static let darkGreen = UIColor(red: 69/255, green: 187/255, blue: 137/255, alpha: 1)
    static let lightBlue = UIColor(red: 61/255, green: 130/255, blue: 171/255, alpha: 1)
    static let darkBlue = UIColor(red: 0, green: 56/255, blue: 83/255, alpha: 1)


}
