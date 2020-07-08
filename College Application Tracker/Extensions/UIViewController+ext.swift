//
//  UIViewController+ext.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/16.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit
import Firebase
extension UIViewController {
    func presentCATAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = CATAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC,animated: true)
        }
    }
    
    func presentEmptyStateView(messageLabel: inout CATTitleLabel?, message: String) {
        messageLabel = CATTitleLabel(textAlignment: .center, fontSize: 28)
        messageLabel!.numberOfLines = 3
        messageLabel!.textColor = .secondaryLabel
        view.addSubview(messageLabel!)

        let labelCenterYConstant: CGFloat = DeviceType.isiPhoneSE || DeviceType.isiPhone8Zoomed ? -80 : -150
        let messageLabelCenterYConstraint = messageLabel!.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: labelCenterYConstant)
        messageLabelCenterYConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            messageLabel!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            messageLabel!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            messageLabel!.heightAnchor.constraint(equalToConstant: 200),
        ])
        messageLabel!.text = message
        
    }
    
}
