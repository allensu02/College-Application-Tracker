//
//  CATAlertContainerView.swift
//  College Application Tracker
//
//  Created by Allen Su on 2020/6/16.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class CATAlertContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = Colors.darkBlue.cgColor
        translatesAutoresizingMaskIntoConstraints = false
        
    }
}
